import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:face_id_plus/app/modules/master/provider/provider.dart';
import 'package:face_id_plus/app/modules/menuAbp/views/list_menu_abp.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/device_update_model.dart';
import '../../../data/providers/provider.dart';
import '../../../data/services/service.dart';
import '../../../data/services/sql_service.dart';
import '../../../data/utils/constants.dart';

class MenuAbpController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final userProvider = MasterProvider();
  final provider = DeviceUpdateProvider();
  final data = <DeviceUpdate>[];
  final listString = <String>[].obs;
  final _service = ApiService();
  final deviceService = DeviceUpdateService();
  final idDevice = RxnString(null);
  final nik = RxnString(null);
  final rule = RxList.empty();
  final perusahaan = RxnString(null);
  late final AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);
  late final Animation<double> animationRun =
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
  List<Widget> widgetList = [];
  final isLoading = true.obs;
  final countColumn = 3.obs;
  @override
  void onInit() async {
    if (Platform.isIOS) {
      var ipad = await isIpad();
      if (ipad) {
        countColumn.value = 6;
      } else {
        countColumn.value = 3;
      }
    }
    getProfileUser();
    super.onInit();
  }

  getProfileUser() async {
    var pref = await SharedPreferences.getInstance();
    var username = pref.getString(Constants.username);
    await userProvider.getUserProfile(username).then((value) {
      var res = value.userProfile;
      if (res != null) {
        if (res.ttd != null) {
          pref.setString(Constants.ttd, "${res.ttd}");
        }
        initIdDevice();
      }
    });
  }

  isIpad() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo info = await deviceInfo.iosInfo;
    if (info.name!.toLowerCase().contains("ipad")) {
      return true;
    }
    return false;
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    bool? isLogin = pref.getBool(Constants.isLoginAbp);
    var intro = pref.getBool(Constants.intro);
    rule.value = pref.getString(Constants.rule)!.split(',');
    perusahaan.value = pref.getString(Constants.company);
    nik.value = pref.getString(Constants.nik);
    var section = pref.getString(Constants.section);
    if (isLogin != null && intro != null) {
      if (!isLogin) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        if (pref.getString(Constants.fotoProfile) == "null") {
          await Get.toNamed(Routes.GANTI_FOTO, arguments: {"baru": true});
          getPref();
        }

        if (pref.getString(Constants.ttd) == "null" ||
            pref.getString(Constants.ttd) == null) {
          await Get.toNamed(Routes.SIGNATURE_CREATE);
          await getPref();
        }

        await deviceService
            .getBy(idDevice: "${idDevice.value}")
            .then((value) async {
          if (kDebugMode) {
            print(" getBy ${value.length}");
          }

          if (value.isNotEmpty) {
            var stringList = [];
            var stringTime = [];
            for (var element in value) {
              stringList.add(element.tipe);
              stringTime.add(element.timeUpdate);
            }
            var z = 0;
            await provider
                .getDeviceTipe(idDevice.value, stringList)
                .then((value) async {
              if (value != null) {
                if (value.deviceUpdate != null) {
                  for (var element in value.deviceUpdate!) {
                    if (stringTime.contains(element.timeUpdate) &&
                        stringList.contains(element.tipe)) {
                      if (kDebugMode) {
                        print("true $z ${element.tipe}");
                      }
                    } else {
                      if (kDebugMode) {
                        print(" false $z ${element.tipe}");
                      }
                      await updateLokal(element.tipe);
                      if (kDebugMode) {
                        print(" false $z ${element.tipe} 1");
                      }

                      var data = DeviceUpdate();
                      data.idDevice = idDevice.value;
                      data.idUpdate = element.idUpdate;
                      data.tipe = element.tipe;
                      data.timeUpdate = element.timeUpdate;
                      var res = await DeviceUpdateService().update(data);
                      if (kDebugMode) {
                        print("deviceUpdateGet $res");
                      }
                    }
                    z++;
                  }
                }
              }
              isLoading.value = false;
            });
          } else {
            loadingService();
          }
        });
      }
      if (kDebugMode) {
        print("perusahaan ${perusahaan.value}");
      }
      if (int.parse("${perusahaan.value}") <= 0) {
        if (section == "SECURITY") {
          widgetList = [
            ListMenuABP().sarpras(),
            ListMenuABP().qrScanner(),
          ];
        } else if (nik.value == "18060207") {
          widgetList = [
            ListMenuABP().hazardWidget(),
            ListMenuABP().rkb(),
            ListMenuABP().sarpras(),
            ListMenuABP().monitoring(),
            ListMenuABP().menuRosterCuti(),
            ListMenuABP().menuP2H(),
            ListMenuABP().masterSarana(),
            ListMenuABP().qrScanner(),
            ListMenuABP().masterAdmin(),
          ];
        } else if (section == "IT") {
          widgetList = [
            ListMenuABP().hazardWidget(),
            ListMenuABP().rkb(),
            ListMenuABP().sarpras(),
            ListMenuABP().monitoring(),
            ListMenuABP().menuRosterCuti(),
            ListMenuABP().menuP2H(),
            ListMenuABP().masterSarana(),
            ListMenuABP().qrScanner(),
          ];
        } else if (section == "KTT") {
          widgetList = [
            ListMenuABP().hazardWidget(),
            ListMenuABP().rkb(),
            ListMenuABP().sarpras(),
            ListMenuABP().monitoring(),
            ListMenuABP().menuRosterCuti(),
            ListMenuABP().menuP2H(),
            ListMenuABP().masterSarana(),
            ListMenuABP().qrScanner(),
          ];
        } else if (section == "KABAG") {
          widgetList = [
            ListMenuABP().hazardWidget(),
            ListMenuABP().rkb(),
            ListMenuABP().sarpras(),
            ListMenuABP().monitoring(),
            ListMenuABP().menuRosterCuti(),
            ListMenuABP().menuP2H(),
            ListMenuABP().masterSarana(),
            ListMenuABP().qrScanner(),
          ];
        } else if (rule.contains("kordinator sarpras")) {
          widgetList = [
            ListMenuABP().hazardWidget(),
            ListMenuABP().rkb(),
            ListMenuABP().sarpras(),
            ListMenuABP().monitoring(),
            ListMenuABP().menuRosterCuti(),
            ListMenuABP().menuP2H(),
            ListMenuABP().masterSarana(),
            ListMenuABP().qrScanner(),
          ];
        } else {
          widgetList = [
            ListMenuABP().hazardWidget(),
            ListMenuABP().rkb(),
            ListMenuABP().sarpras(),
            ListMenuABP().monitoring(),
            ListMenuABP().menuRosterCuti(),
            ListMenuABP().menuP2H(),
            ListMenuABP().qrScanner(),
          ];
        }
      } else if (perusahaan.value != "0") {
        widgetList = [
          ListMenuABP().hazardWidget(),
          ListMenuABP().qrScanner(),
        ];
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    if (kDebugMode) {
      print("islogin and intro $isLogin $intro");
    }
  }

  loadingService() async {
    listString.clear();

    await _service.kemungkinanGet();
    listString.add("kemungkinan");
    await _service.keparahanGet();
    listString.add("keparahan");

    await _service.metrikGet();
    listString.add("metrik");

    await _service.perusahaanGet();
    listString.add("perusahaan");

    await _service.lokasiGet();
    listString.add("lokasi");

    await _service.detKeparahanGet();
    listString.add("detKeparahan");

    await _service.pengendalianGet();
    listString.add("pengendalian");

    await _service.detPengendalianGet();
    listString.add("detPengendalian");

    await _service.usersGet();
    listString.add("user");

    await provider
        .insertDeviceUpdate(idDevice.value, listString)
        .then((value) async {
      if (value.success) {
        await _service.deviceUpdateGet(idDevice.value);
        isLoading.value = false;
      }
    });
  }

  initIdDevice() async {
    String? idDevices;
    try {
      idDevices = await PlatformDeviceId.getDeviceId;
      // ignore: unnecessary_null_comparison
      if (idDevice != null) {
        idDevice.value = idDevices;
        getPref();
      } else {
        initIdDevice();
      }
    } on PlatformException {
      if (kDebugMode) {
        print("ERROR");
      }
    }
  }

  updateLokal(tipe) async {
    listString.clear();
    switch (tipe) {
      case "kemungkinan":
        await _service.kemungkinanGet();
        listString.add("kemungkinan");
        if (kDebugMode) {
          print("tipe $tipe 1");
        }
        break;
      case "keparahan":
        await _service.keparahanGet();
        listString.add("keparahan");
        if (kDebugMode) {
          print("tipe $tipe 2");
        }

        break;
      case "metrik":
        await _service.metrikGet();
        listString.add("metrik");
        if (kDebugMode) {
          print("tipe $tipe 3");
        }
        break;
      case "perusahaan":
        await _service.perusahaanGet();
        listString.add("perusahaan");
        if (kDebugMode) {
          print("tipe $tipe 4");
        }
        break;
      case "lokasi":
        await _service.lokasiGet();
        listString.add("lokasi");
        if (kDebugMode) {
          print("tipe $tipe 5");
        }
        break;
      case "detKeparahan":
        await _service.detKeparahanGet();
        listString.add("detKeparahan");
        if (kDebugMode) {
          print("tipe $tipe 6");
        }
        break;
      case "pengendalian":
        await _service.pengendalianGet();
        listString.add("pengendalian");
        if (kDebugMode) {
          print("tipe $tipe 7");
        }
        break;
      case "detPengendalian":
        await _service.detPengendalianGet();
        listString.add("detPengendalian");
        if (kDebugMode) {
          print("tipe $tipe 8");
        }
        break;
      case "user":
        await _service.usersGet();
        listString.add("user");
        if (kDebugMode) {
          print("tipe $tipe 9");
        }
        break;
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
