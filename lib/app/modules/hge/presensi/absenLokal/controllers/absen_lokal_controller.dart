import 'dart:async';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/models/last_absen_models.dart';
import '../../../../../data/provider.dart';
import '../../../../../data/providers/last_absen_provider.dart';
import '../../../../../data/utils/constants.dart';
import '../../../../../routes/app_pages.dart';

class AbsenLokalController extends GetxController {
  final provider = Provider();
  final _provider = LastAbsenProvider();
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
  ui.Codec? codec;
  @override
  void onInit() {
    getPref();
    super.onInit();
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

  loadLastAbsen(nik, company) async {
    await _provider.getLastAbsen(nik, company).then((LastAbsenModels? value) {
      if (value != null) {
        lastAbsen.value = value;
        if (value.absensi != null) {
          absenTerakhir.value = "${value.absensi}";
        }
        tanggal.value = (value.tanggal != null)
            ? fmt.format(DateTime.parse("${value.tanggal}"))
            : "";
        rosterKerja.value = "${value.kodeRoster}";
        jamKerja.value = "${value.jamKerja}";

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
}
