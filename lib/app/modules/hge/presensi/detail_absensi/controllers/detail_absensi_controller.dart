import 'package:face_id_plus/app/data/models/last_absen_model.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailAbsensiController extends GetxController {
  final detail = Presensi().obs;
  final nama = RxnString(null);
  DateFormat fmt = DateFormat("dd MMMM yyyy");

  @override
  void onInit() {
    getPref();
    var det = Get.arguments['detail'] as Presensi;
    if (det != null) {
      detail.value = det;
    }
    print("detail ${detail}");
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    nama.value = pref.getString(Constants.namaAbsen);
  }
}
