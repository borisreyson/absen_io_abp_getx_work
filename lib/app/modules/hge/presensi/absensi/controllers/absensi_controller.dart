import 'dart:async';
import 'package:face_id_plus/app/data/providers/last_absen_provider.dart';
import 'package:face_id_plus/app/data/providers/provider.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import '../../../../../data/models/last_absen_models.dart';
import '../../../../../data/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

class AbsensiController extends GetxController {
  StreamSubscription<bool>? subs;
  final provider = Provider();
  final _provider = LastAbsenProvider();
  final kGooglePlex = const CameraPosition(
          target: LatLng(-0.5634222, 117.0139606), zoom: 14.2746)
      .obs;
  late GoogleMapController googleMapController;
  var mapController = Completer();
  final StreamController<String> _streamClock = StreamController.broadcast();
  Timer? _timer, _timerClock;
  final lastAbsen = LastAbsenModels().obs;
  final presensi = Presensi().obs;
  final isLogin = false.obs;
  final nik = RxnString('');
  final jamS = 00.obs;
  final menitS = 00.obs;
  final detikS = 00.obs;
  final startClock = RxnString('');
  final nama = RxnString('');
  final tanggal = RxnString('');
  final fmt = DateFormat("dd MMMM yyyy");
  final rosterKerja = RxnString('');
  final jamKerja = RxnString('');
  final perusahaan = RxnString('');
  final serverJam = JamServer().obs;
  final absenTerakhir = 'Masuk'.obs;

  late StreamController<bool> _getLokasi;
  late bool serviceEnable = false;
  Position? position;
  late Position currentPosition;
  LatLng? myLocation;
  final outside = false.obs;
  bool iosMapLocation = false;
  bool lokasiPalsu = false;
  final _diluarAbp = 0.0.obs;
  ui.Codec? codec;
  Uint8List? markerIcon;
  late BitmapDescriptor customIcon;
  late Marker marker;
  final markers = <Marker>{};
  final markerID = const MarkerId("abpenergy");
  final polygons = <Polygon>{};
  late List<LatLng> pointABP = [];

  final statusLokasi = false.obs;

  @override
  void onReady() {
    izinLokasi();

    super.onReady();
  }

  @override
  void onClose() {}

  loadLastAbsen(nik, company) async {
    await _provider.getLastAbsen(nik, company).then((LastAbsenModels? value) {
      if (value != null) {
        setCustomMapPin();
        lastAbsen.value = value;
        if (value.absensi != null) {
          absenTerakhir.value = "${value.absensi}";
        }
        tanggal.value = (value.tanggal != null)
            ? fmt.format(DateTime.parse("${value.tanggal}"))
            : "";
        rosterKerja.value = "${value.kodeRoster}";
        jamKerja.value = "${value.jamKerja}";

        if (value.mapArea != null) {
          for (var element in value.mapArea!) {
            pointABP.add(LatLng(element.lat!, element.lng!));
          }
          // ignore: unused_local_variable
          for (var element in pointABP) {
            polygons.add(Polygon(
                polygonId: const PolygonId("ABP"),
                points: pointABP,
                strokeWidth: 2,
                strokeColor: Colors.red,
                fillColor: Colors.green.withOpacity(0.25)));
          }
        }

        if (value.presensi != null) {
          presensi.value = value.presensi!;
        }
        if (value.jamServer != null) {
          serverJam.value = value.jamServer!;
          jamS.value = int.parse("${value.jamServer?.jam}");
          menitS.value = int.parse("${value.jamServer?.menit}");
          detikS.value = int.parse("${value.jamServer?.detik}");
          streamJam();
        }
      }
    });
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.getBool(Constants.isLogin) != null) {
      isLogin.value = pref.getBool(Constants.isLogin)!;
      nama.value = pref.getString(Constants.namaAbsen);
      perusahaan.value = pref.getString(Constants.perusahaanAbsen);

      nik.value = pref.getString(Constants.nikAbsen);
      loadLastAbsen(nik.value, perusahaan.value);
    } else {
      Get.offAllNamed(Routes.LOGIN_ABSEN);
    }
  }

  streamJam() {
    _timerClock?.cancel();
    createJamStream();
    _streamClock.add(doJam());
    _timerClock = Timer.periodic(const Duration(seconds: 1), (timer) {
      _streamClock.add(doJam());
    });
  }

  createJamStream() {
    _streamClock.stream.listen((String clock) {
      startClock.value = clock;
    });
  }

  String doJam() {
    if (detikS.value >= 59) {
      if (menitS.value >= 59) {
        if (jamS.value >= 23) {
          jamS.value = 00;
          menitS.value = 00;
          detikS.value = 00;
        } else {
          jamS.value = jamS.value + 1;
          menitS.value = 00;
          detikS.value = 00;
        }
      } else {
        menitS.value = menitS.value + 1;
        detikS.value = 00;
      }
    } else {
      detikS.value = detikS.value + 1;
    }
    return "${jamS.value.toString().padLeft(2, "0")}:${menitS.value.toString().padLeft(2, "0")}:${detikS.value.toString().padLeft(2, "0")}";
  }

  bool _checkIfValidMarker(LatLng tap, List<LatLng> vertices) {
    int intersectCount = 0;
    for (int j = 0; j < vertices.length - 1; j++) {
      if (rayCastIntersect(tap, vertices[j], vertices[j + 1])) {
        intersectCount++;
      }
    }

    return ((intersectCount % 2) == 1); // odd = inside, even = outside;
  }

  bool rayCastIntersect(LatLng tap, LatLng vertA, LatLng vertB) {
    double aY = vertA.latitude;
    double bY = vertB.latitude;
    double aX = vertA.longitude;
    double bX = vertB.longitude;
    double pY = tap.latitude;
    double pX = tap.longitude;

    if ((aY > pY && bY > pY) || (aY < pY && bY < pY) || (aX < pX && bX < pX)) {
      return false; // a and b can't both be above or below pt.y, and a or
      // b must be east of pt.x
    }

    double m = (aY - bY) / (aX - bX); // Rise over run
    double bee = (-aX) * m + aY; // y = mx + b
    double x = (pY - bee) / m; // algebra is neat!

    return x > pX;
  }

  streamLokasi() async {
    createStream();
    _getLokasi.add(await locatePosition());
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      _getLokasi.add(await locatePosition());
    });
  }

  createStream() {
    _getLokasi = StreamController.broadcast();
    subs = _getLokasi.stream.listen((bool e) async {
      if (e) {
        if (lokasiPalsu == true) {
          closeStream();
          Get.offAllNamed(Routes.LOKASI_PALSU);
        } else {
          if (serviceEnable) {
            if (myLocation != null) {
              CameraPosition cameraPosition =
                  CameraPosition(target: myLocation!, zoom: 17.5756);
              try {
                await googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
              } catch (e) {
                if (kDebugMode) {
                  print("Error ${e.toString()}");
                }
              }
            }
          }
        }
      }
    });
  }

  Future<bool> locatePosition() async {
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (serviceEnable) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition = position!;
      myLocation = LatLng(currentPosition.latitude, currentPosition.longitude);
      lokasiPalsu = position!.isMocked;

      if (myLocation != null) {
        if (!iosMapLocation) {
          iosMapLocation = true;
        }
        if (myLocation != null) {
          bool insideAbp = _checkIfValidMarker(myLocation!, pointABP);
          if (insideAbp) {
            _diluarAbp.value = 0.0;
            outside.value = true;
          } else {
            outside.value = false;
            _diluarAbp.value = 1.0;
          }
        }
        return true;
      } else {
        return false;
      }
    } else {
      outside.value = false;
      _diluarAbp.value = 1.0;
      return false;
    }
  }

  closeStream() {
    subs?.cancel();
    googleMapController.dispose();
    _getLokasi.close();
    _timer?.cancel();
    markers.clear();
    polygons.clear();
    pointABP.clear();
  }

  void setCustomMapPin() async {
    markerIcon = await getBytesFromAsset('assets/images/abp_60x60.png', 60);
    customIcon = BitmapDescriptor.fromBytes(markerIcon!);
    marker = Marker(
      markerId: markerID,
      position: const LatLng(-0.5634222, 117.0139606),
      icon: customIcon,
      infoWindow: const InfoWindow(
        title: 'PT Alamjaya Bara Pratama',
      ),
    );
    markers.add(marker);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec!.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void onMapCreated(GoogleMapController c) async {
    googleMapController = c;
    mapController.complete(c);
    streamLokasi();
  }

  Future<bool> onPop() async {
    return true;
  }

  izinLokasi() async {
    var lokasi = handler.Permission.locationWhenInUse;
    var status = await lokasi.status;
    if (status == handler.PermissionStatus.granted) {
      statusLokasi.value = true;
    } else if (status == handler.PermissionStatus.denied) {
      statusLokasi.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      statusLokasi.value = false;
    }
    if (!statusLokasi.value) {
      Get.back(result: false);
      await Get.toNamed(Routes.IZIN_LOKASI);
    } else {
      getPref();
    }
  }
}
