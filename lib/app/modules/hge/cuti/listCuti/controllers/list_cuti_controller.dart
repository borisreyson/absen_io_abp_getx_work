import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart';

class ListCutiController extends GetxController {
  final provider = ProviderCuti();
  final dataCuti = <Data>[].obs;
  final nikKaryawan = RxnString(null);
  final lastPage = 1.obs;
  final page = 1.obs;
  final loaded = false.obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final jam = DateFormat("HH:mm:ss");
  final refreshCtrl = RefreshController();
  final pullUp = false.obs;
  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    nikKaryawan.value = pref.getString(Constants.nik);
    dataCuti.clear();
    page.value = 1;
    getCutiUser(nikKaryawan.value, page.value);
    super.onInit();
  }

  getCutiUser(nik, hal) async {
    await provider.getCutiUser(nik: nik, page: hal).then((value) {
      var res = value.cutiOnline;
      if (res != null) {
        var response = res.data;
        lastPage.value = int.parse("${res.lastPage}");
        if (page.value == lastPage.value) {
          pullUp.value = false;
        } else {
          pullUp.value = true;
        }
        if (response != null) {
          for (var e in response) {
            dataCuti.add(e);
          }
          refreshCtrl.refreshCompleted();
          refreshCtrl.loadComplete();
        }
      }
    }).whenComplete(() {
      loaded.value = true;
    });
  }

  void onRefresh() {
    page.value = 1;
    dataCuti.clear();
    getCutiUser(nikKaryawan.value, page.value);
  }

  void onLoading() {
    if (page.value < lastPage.value) {
      page.value++;
      getCutiUser(nikKaryawan.value, page.value);
    } else {
      if (page == lastPage) {
        pullUp.value = false;
      } else {
        pullUp.value = true;
      }
    }
  }
}
