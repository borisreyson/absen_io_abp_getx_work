import 'package:face_id_plus/app/data/models/rosterkerja.dart';
import 'package:face_id_plus/app/data/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/utils/constants.dart';

class RosterKerjaController extends GetxController {
  final _provider = Provider();
  final listRoster = <Roster>[].obs;
  final dataKey = GlobalKey();
  @override
  void onInit() async {
    await loadRoster();
    super.onInit();
  }

  @override
  void onReady() {
    if (dataKey.currentContext != null) {
      Scrollable.ensureVisible(dataKey.currentContext!);
    }
    super.onReady();
  }

  @override
  void onClose() {}
  loadRoster() async {
    var pref = await SharedPreferences.getInstance();
    var nik = pref.getString(Constants.nikAbsen);

    var dt = DateTime.now();
    var tahun = dt.year;
    var bulan = dt.month;
    if (nik != null) {
      await _provider
          .getRoster(nik, "$bulan".padLeft(2, "0"), "$tahun")
          .then((value) {
        print("value $bulan");
        var res = value.roster;
        if (res != null) {
          listRoster.addAll(res);
        }
      });
    }
  }
}
