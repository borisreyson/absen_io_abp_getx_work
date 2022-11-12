import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/home/buletin_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/buletin_provider.dart';

class HomeController extends GetxController {
  final _provider = BuletinProvider();
  final indexSelect = 0.obs;
  final page = 1.obs;
  late RefreshController pullRefresh;
  final versiAplikasi = RxnString(null);
  final dataBuletin = <Data>[].obs;
  final loaded = false.obs;
  final lastPage = 1.obs;
  final pullUp = false.obs;

  @override
  void onInit() async {
    pullRefresh = RefreshController(initialRefresh: false);
    dataBuletin.clear();
    page.value = 1;
    getBuletin(page.value);
    // getVersionCode();
    super.onInit();
  }

  void onLoading() async {
    if (lastPage.value > page.value) {
      pullUp.value = true;
      page.value++;
      getBuletin(page.value);
    } else {
      pullUp.value = false;
    }
  }

  void onRefresh() async {
    dataBuletin.clear();
    page.value = 1;
    getBuletin(page.value);
  }

  getBuletin(hal) async {
    await _provider.getBuletinPage(hal).then((value) {
      var res = value.data;
      var endPage = value.lastPage;
      if (endPage != null) {
        lastPage.value = endPage;
      }
      if (res != null) {
        for (var e in res) {
          dataBuletin.add(e);
        }
        pullRefresh.loadComplete();
        pullRefresh.refreshCompleted();
      }
    }).whenComplete(() => loaded.value = true);
  }

  getVersionCode() async {
    var pref = await SharedPreferences.getInstance();
    versiAplikasi.value = pref.getString(Constants.versiAplikasi);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var version = packageInfo.version;
    if (versiAplikasi.value != null) {
      if (int.parse(version) > int.parse("${versiAplikasi.value}")) {
        print(" Versi APP $version  | Versi Sebelumnya ${versiAplikasi.value}");
      } else {
        print(" Versi APP $version  | Versi Sebelumnya ${versiAplikasi.value}");
      }
    } else {
      versiAplikasi.value = version;
      print(" Versi APP $version  | Versi Sebelumnya ${versiAplikasi.value}");
    }
    if (kDebugMode) {
      print(version);
    }
  }
}
