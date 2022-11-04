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
  Rx<Buletin>? buletin = Buletin().obs;
  final page = 1.obs;
  late RefreshController pullRefresh;
  final versiAplikasi = RxnString(null);
  @override
  void onInit() async {
    pullRefresh = RefreshController(initialRefresh: false);
    await _provider.getBuletinPage(1).then((value) {
      buletin?.value = value!;
    });
    // getVersionCode();
    super.onInit();
  }

  void onLoading() async {
    page.value++;
    await _provider
        .getBuletinPage(int.parse("$page"))
        .then((value) => buletin?.value = value!);
    pullRefresh.loadComplete();
    pullRefresh.refreshCompleted();
  }

  void onRefresh() async {
    page.value = 1;
    await _provider
        .getBuletinPage(int.parse("$page"))
        .then((value) => buletin?.value = value!);
    pullRefresh.loadComplete();
    pullRefresh.refreshCompleted();
  }

  internetPermission() async {
    // var permission = handler.Permission.
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
