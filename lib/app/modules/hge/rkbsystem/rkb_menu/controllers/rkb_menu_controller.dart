import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/approve_menu_view.dart';
import '../views/dept_view_view.dart';
import '../views/ktt_approve_view.dart';
import '../views/user_view_view.dart';

class RkbMenuController extends GetxController {
  final nik = RxnString(null);
  final nama = RxnString(null);
  final rule = RxnString(null);
  final jabatan = RxnString(null);
  final departemen = RxnString(null);
  final perusahaan = RxnString(null);
  final validasi = [].obs;
  var listMenu = <Widget>[].obs;
  @override
  void onInit() {
    getPref();
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    nik.value = pref.getString(Constants.nik);
    nama.value = pref.getString(Constants.name);
    rule.value = pref.getString(Constants.rule);
    jabatan.value = pref.getString(Constants.section);
    departemen.value = pref.getString(Constants.departement);
    perusahaan.value = pref.getString(Constants.company);
    if (rule.value != null) {
      validasi.addAll(rule.value!.split(","));
    }
    if (validasi.contains("rkb")) {
      // ignore: unrelated_type_equality_checks
      if (jabatan != "IT") {
        listMenu.value = [const UserViewView(), const DeptViewView()];
      }
    }
    // ignore: unrelated_type_equality_checks
    if (jabatan == "IT") {
      listMenu.value = [
        const UserViewView(),
        const DeptViewView(),
        const ApproveMenuView(),
        const KttApproveView()
      ];
    }
    // ignore: unrelated_type_equality_checks
    if (jabatan == "KTT") {
      listMenu.value = [const KttApproveView()];
    }
    // ignore: unrelated_type_equality_checks
    if (jabatan == "KABAG") {
      listMenu.value = [const ApproveMenuView(), const DeptViewView()];
    }
    if (kDebugMode) {
      print("jabatan $jabatan");
    }
  }
}
