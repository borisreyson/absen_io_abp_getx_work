import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/widget_sarpras.dart';

class MenuSarprasController extends GetxController {
  final widgetSarpras = WidgetSarpras();
  final listMenu = <Widget>[].obs;
  final username = RxnString(null);
  final nik = RxnString(null);
  final nama = RxnString(null);
  final jabatan = RxnString(null);
  final section = RxnString(null);
  final departemen = RxnString(null);
  final perusahaan = RxnString(null);
  final rule = RxnString(null);
  @override
  void onInit() async {
    await getPref();
    if (section.value == "IT") {
      //IT
      listMenu.value = [
        widgetSarpras.listSarprasIT(),
        widgetSarpras.listSarprasKTT(),
        widgetSarpras.listSarprasKabag(),
        widgetSarpras.listSarprasSection(),
        widgetSarpras.listSarprasHc(),
        widgetSarpras.listSarprasKordinator(),
        widgetSarpras.listSarprasUser(),
        widgetSarpras.approveSarprasKabag(),
        widgetSarpras.approveSarprasHC(),
        widgetSarpras.approveSarprasSection(),
        widgetSarpras.approveSarprasKordinator(),
        widgetSarpras.listSarana(),
        widgetSarpras.formKeluarLv(),
        widgetSarpras.formIzinKeluar(),
        widgetSarpras.scanBarcodeSarpras(),
      ];

      //Users
      // listMenu.value = [
      //   widgetSarpras.listSarprasUser(),
      //   widgetSarpras.formKeluarLv(),
      //   widgetSarpras.formIzinKeluar(),
      // ];

      //Kabag
      // listMenu.value = [
      //   widgetSarpras.listSarprasKabag(),
      //   widgetSarpras.approveSarprasKabag(),
      //   widgetSarpras.listSarana(),
      //   widgetSarpras.formKeluarLv(),
      //   widgetSarpras.formIzinKeluar(),
      // ];

      //Section
      // listMenu.value = [
      //   widgetSarpras.listSarprasSection(),
      //   widgetSarpras.approveSarprasSection(),
      //   widgetSarpras.listSarana(),
      //   widgetSarpras.formKeluarLv(),
      //   widgetSarpras.formIzinKeluar(),
      // ];

      //HC
      // listMenu.value = [
      //   widgetSarpras.listSarprasHc(),
      //   widgetSarpras.approveSarprasHC(),
      //   widgetSarpras.listSarana(),
      //   widgetSarpras.formKeluarLv(),
      //   widgetSarpras.formIzinKeluar(),
      // ];

      //Kordinator
      // listMenu.value = [
      //   widgetSarpras.listSarprasKordinator(),
      //   widgetSarpras.approveSarprasKordinator(),
      //   widgetSarpras.listSarana(),
      //   widgetSarpras.formKeluarLv(),
      //   widgetSarpras.formIzinKeluar(),
      // ];

      //KTT
      // listMenu.value = [
      //   widgetSarpras.listSarprasKTT(),
      //   widgetSarpras.listSarana(),
      //   widgetSarpras.formKeluarLv(),
      //   widgetSarpras.formIzinKeluar(),
      // ];

    } else if (rule.value!.contains("kordinator sarpras")) {
      if (section.value == "SECURITY") {
        //security
        listMenu.value = [
          widgetSarpras.listSarprasSecurity(),
          widgetSarpras.formKeluarLv(),
        ];
      } else {
        //kordinator
        listMenu.value = [
          widgetSarpras.listSarprasKordinator(),
          widgetSarpras.formKeluarLv(),
        ];
      }
    } else if (rule.value!.contains("hr sarpras")) {
      //hc
      listMenu.value = [
        widgetSarpras.listSarprasHc(),
        widgetSarpras.formKeluarLv(),
      ];
    } else if (section.value == "SECTION_HEAD") {
      //section
      listMenu.value = [
        widgetSarpras.listSarprasSection(),
        widgetSarpras.formKeluarLv(),
      ];
    } else if (section.value == "KABAG") {
      //Kabag
      listMenu.value = [
        widgetSarpras.listSarprasKabag(),
        widgetSarpras.formKeluarLv(),
      ];
    } else if (section.value == "KTT") {
      //ktt
      listMenu.value = [
        widgetSarpras.listSarprasKTT(),
        widgetSarpras.formKeluarLv(),
      ];
    } else {
      //user
      listMenu.value = [
        widgetSarpras.listSarprasUser(),
        widgetSarpras.formKeluarLv(),
      ];
    }
    print("section ${section.value}");
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
    nik.value = pref.getString(Constants.nik);
    nama.value = pref.getString(Constants.name);
    jabatan.value = pref.getString(Constants.jabatan);
    section.value = pref.getString(Constants.section);
    departemen.value = pref.getString(Constants.departement);
    perusahaan.value = pref.getString(Constants.company);
    rule.value = pref.getString(Constants.rule);
  }
}
