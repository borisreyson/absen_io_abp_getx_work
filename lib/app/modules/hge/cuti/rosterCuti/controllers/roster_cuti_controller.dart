import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/roster_cuti_karyawan.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RosterCutiController extends GetxController {
  final provider = ProviderCuti();
  final rosterCuti = <Data>[].obs;
  final lastPage = 1.obs;
  final nik = RxnString(null);
  final page = 1.obs;
  DateFormat fmt = DateFormat('dd MMMM yyyy');
  final nama = RxnString(null);
  final argumen = false.obs;
  @override
  void onInit() async {
    var cek = await Get.arguments;
    if (cek != null) {
      argumen.value = cek['argumen'];
      print("${argumen.value}");
    }
    var pref = await SharedPreferences.getInstance();
    nik.value = pref.getString(Constants.nik);
    nama.value = pref.getString(Constants.name);
    if (nik.value != null) {
      getCuti(nik.value, page.value);
    }
    super.onInit();
  }

  getCuti(nik, hal) async {
    await provider.rosterCutiKaryawan(nik: nik, page: hal).then((value) {
      var result = value.rosterKaryawan;
      print("${result?.currentPage}");

      if (result != null) {
        lastPage.value = int.parse("${result.lastPage}");
        var data = result.data;
        if (data != null) {
          rosterCuti.addAll(data);
        }
      }
    });
  }
}
