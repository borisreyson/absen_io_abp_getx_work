import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:face_id_plus/app/data/models/last_absen_models.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/providers/last_absen_provider.dart';
import '../../../../../data/utils/constants.dart';

class AbsensiVPSController extends GetxController {
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
  String? nik;
  final jamS = 00.obs;
  final menitS = 00.obs;
  final detikS = 00.obs;
  final startClock = "00:00:00".obs;
  final nama = ''.obs;
  final tanggal = ''.obs;
  final fmt = DateFormat("dd MMMM yyyy");
  final rosterKerja = ''.obs;
  final jamKerja = ''.obs;
  final perusahaan = ''.obs;
  final StreamController<bool> _getLokasi = StreamController.broadcast();
  late bool serviceEnable = false;
  Position? position;
  late Position currentPosition;
  LatLng? myLocation;
  bool outside = false;
  bool iosMapLocation = false;
  bool lokasiPalsu = false;
  ui.Codec? codec;
  Uint8List? markerIcon;
  late BitmapDescriptor customIcon;
  late Marker marker;
  final markers = <Marker>{}.obs;
  final markerID = const MarkerId("abpenergy");
  final polygons = <Polygon>{}.obs;
  late List<LatLng> pointABP = [];
  @override
  void onInit() async {
    getPref();
    super.onInit();
  }

  @override
  void onClose() {}
  loadLastAbsen(nik, company) async {
    await _provider.getLastAbsen(nik, company).then((LastAbsenModels? value) {
      if (value != null) {
        lastAbsen.value = value;
        tanggal.value = fmt.format(DateTime.parse(value.tanggal!));
        rosterKerja.value = "${value.kodeRoster}";
        jamKerja.value = "${value.jamKerja}";

        if (value.mapArea != null) {
          for (var element in value.mapArea!) {
            pointABP.add(LatLng(element.lat!, element.lng!));
          }
          for (var element in pointABP) {
            print("$element");
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
      nama.value = pref.getString(Constants.namaAbsen)!;
      perusahaan.value = pref.getString(Constants.perusahaanAbsen)!;

      nik = pref.getString(Constants.nikAbsen);
      loadLastAbsen(nik, perusahaan.value);
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
    _getLokasi.stream.listen((bool e) async {
      if (e) {
        if (lokasiPalsu == true) {
          closeStream();
          Get.offAllNamed('/lokasi-palsu');
        } else {
          if (serviceEnable) {
            CameraPosition cameraPosition =
                CameraPosition(target: myLocation!, zoom: 17.5756);
            await googleMapController
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
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

        return true;
      } else {
        return false;
      }
    } else {
      outside = false;
      return false;
    }
  }

  closeStream() {
    _timer?.cancel();
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
    markers.value.add(marker);
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
}
