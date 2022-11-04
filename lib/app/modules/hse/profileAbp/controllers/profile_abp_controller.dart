import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/models/lupa_sandi_detail.dart';
import '../../../../data/providers/register_provider.dart';

class ProfileAbpController extends GetxController {
  final provider = RegisterProvider();
  final nik = RxnString(null);
  final nama = RxnString(null);
  final jabatan = RxnString(null);
  final dept = RxnString(null);
  final perusahaan = RxnString(null);
  final level = RxnString(null);
  final foto = RxnString(null);
  final dataLogin = DataLogin().obs;

  @override
  void onInit() {
    getPref();
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    nik.value = pref.getString(Constants.nik);
    nama.value = pref.getString(Constants.name);
    jabatan.value = pref.getString(Constants.section);
    dept.value = pref.getString(Constants.departement);
    perusahaan.value = pref.getString(Constants.company);
    foto.value = pref.getString(Constants.fotoProfile);
    var username = pref.getString(Constants.username);
    cekUsername(username);
  }

  cekUsername(username) async {
    await provider.cekUsernameDetail(username).then((value) {
      if (value != null) {
        var res = value.dataLogin;
        if (res != null) {
          dataLogin.value = res;
        }
      }
    });
  }
}
