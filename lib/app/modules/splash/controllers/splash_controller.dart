import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:face_id_plus/app/modules/splash/provider/provider.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../../data/utils/constants.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);
  late final animation =
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn).obs;
  final cameraStatus = false.obs;
  final penyimpananStatus = false.obs;
  final lokasiStatus = false.obs;
  final galeryStatus = false.obs;
  var dio = Dio();
  final progress = RxDouble(0.0);
  final provider = SplashProvider();
  late var camera;
  final newPath = RxString("");

  @override
  void onInit() async {
    await checkIntro();
    super.onInit();
  }

  Future<bool> izinCamera() async {
    var camera = handler.Permission.camera;
    var status = await camera.status;
    if (status == handler.PermissionStatus.granted) {
      cameraStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      cameraStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      cameraStatus.value = false;
    }
    return cameraStatus.value;
  }

  Future<bool> izinPenyimpanan() async {
    if (Platform.isAndroid) {
      var osVersion = await DeviceInfoPlugin().androidInfo;
      if (int.parse("${osVersion.version.release}") > 10) {
        camera = await handler.Permission.storage.status;
      } else {
        camera = await handler.Permission.storage.status;
      }
      var status = camera;
      if (status == handler.PermissionStatus.granted) {
        penyimpananStatus.value = true;
      }
      if (status == handler.PermissionStatus.denied) {
        penyimpananStatus.value = false;
      } else if (status == handler.PermissionStatus.permanentlyDenied) {
        penyimpananStatus.value = false;
      }
      return penyimpananStatus.value;
    } else {
      camera = await handler.Permission.storage.status;
      var status = camera;
      if (status == handler.PermissionStatus.granted) {
        penyimpananStatus.value = true;
      }
      if (status == handler.PermissionStatus.denied) {
        penyimpananStatus.value = false;
      } else if (status == handler.PermissionStatus.permanentlyDenied) {
        penyimpananStatus.value = false;
      }
      return penyimpananStatus.value;
    }
  }

  Future<bool> izinLokasi() async {
    var camera = handler.Permission.locationWhenInUse;
    var status = await camera.status;
    if (status == handler.PermissionStatus.granted) {
      lokasiStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      lokasiStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      lokasiStatus.value = false;
    }
    return lokasiStatus.value;
  }

  Future<bool> izinGalery() async {
    var camera = handler.Permission.photos;
    var status = await camera.status;
    print("Galery ${status.isDenied}");
    if (status == handler.PermissionStatus.granted) {
      galeryStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      galeryStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      galeryStatus.value = false;
    }
    return galeryStatus.value;
  }

  checkIntro() async {
    var pref = await SharedPreferences.getInstance();
    var intro = pref.getBool(Constants.intro);
    if (intro != null) {
      if (intro) {
        await izinCamera();
        if (Platform.isAndroid) {
          await izinPenyimpanan();
        }
        await izinGalery();
        await izinLokasi();
        if (Platform.isAndroid) {
          if (cameraStatus.value &&
              penyimpananStatus.value &&
              lokasiStatus.value) {
            await cekFilePendukung();

            Get.offAllNamed('/home');
          } else {
            Get.offAllNamed('/lokasi');
          }
        } else {
          if (cameraStatus.value && lokasiStatus.value && galeryStatus.value) {
            await cekFilePendukung();

            Get.offAllNamed('/home');
          } else {
            Get.offAllNamed('/lokasi');
          }
        }
      } else {
        await izinCamera();
        if (Platform.isAndroid) {
          await izinPenyimpanan();
        }
        await izinGalery();
        await izinLokasi();

        if (Platform.isAndroid) {
          if (cameraStatus.value &&
              penyimpananStatus.value &&
              lokasiStatus.value) {
            await cekFilePendukung();

            Get.offAllNamed('/home');
          } else {
            Get.offAllNamed('/lokasi');
          }
        } else {
          if (cameraStatus.value && lokasiStatus.value && galeryStatus.value) {
            await cekFilePendukung();

            Get.offAllNamed('/home');
          } else {
            Get.offAllNamed('/lokasi');
          }
        }
      }
    } else {
      await izinCamera();
      if (Platform.isAndroid) {
        await izinPenyimpanan();
      }
      await izinGalery();
      await izinLokasi();
      if (Platform.isAndroid) {
        if (cameraStatus.value &&
            penyimpananStatus.value &&
            lokasiStatus.value) {
          await cekFilePendukung();

          Get.offAllNamed('/home');
        } else {
          Get.offAllNamed('/lokasi');
        }
      } else {
        if (cameraStatus.value && lokasiStatus.value && galeryStatus.value) {
          await cekFilePendukung();

          Get.offAllNamed('/home');
        } else {
          Get.offAllNamed('/lokasi');
        }
      }
    }
    print(
        "intro $intro , ${cameraStatus.value} , ${penyimpananStatus.value} , ${lokasiStatus.value} , ${galeryStatus.value}");
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }

  cekFilePendukung() async {
    await provider.cekFilePendukung().then((value) async {
      var res = value?.filePendukung;
      if (res != null) {
        var pref = await SharedPreferences.getInstance();
        var waktuPertama = pref.getString(Constants.musik1Time);
        var waktuKedua = pref.getString(Constants.musik2Time);
        var musik1 = pref.getString(Constants.musik1);
        var musik2 = pref.getString(Constants.musik2);
        if (musik1 == null &&
            musik2 == null &&
            waktuPertama == null &&
            waktuKedua == null) {
          if (await downloadFile(1)) {
            pref.setString(Constants.musik1, "${res[0].namaFile}");
            pref.setString(Constants.musik1Time, "${res[0].updateFile}");
            print("OK");
          } else {
            print("Not OK");
          }
          if (await downloadFile(2)) {
            pref.setString(Constants.musik2, "${res[1].namaFile}");
            pref.setString(Constants.musik2Time, "${res[1].updateFile}");
            print("1OK");
          } else {
            print("1Not OK");
          }
        } else {
          var dtUpdate = DateTime.parse("$waktuPertama");
          var dtUpdate2 = DateTime.parse("$waktuKedua");
          var waktuA = DateTime.parse("${res[0].updateFile}");
          var waktub = DateTime.parse("${res[1].updateFile}");
          if (waktuA.isAfter(dtUpdate)) {
            if (await downloadFile(1)) {
              pref.setString(
                  Constants.musik1, "${newPath.value}/${res[0].namaFile}");
              pref.setString(Constants.musik1Time, "${res[0].updateFile}");
              print("2OK");
            } else {
              print("2Not OK");
            }
          }
          if (waktub.isAfter(dtUpdate2)) {
            if (await downloadFile(2)) {
              pref.setString(
                  Constants.musik2, "${newPath.value}/${res[1].namaFile}");
              pref.setString(Constants.musik2Time, "${res[1].updateFile}");
              print("3OK");
            } else {
              print("3Not OK");
            }
          }
        }
      }
    });
  }

  Future<bool> _reqPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> downloadFile(index) async {
    var namaFile = "musik${index}.mp3";
    var url = "https://abpjobsite.com/musik${index}.mp3";
    print("namaFile $namaFile");
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        var osVersion = await DeviceInfoPlugin().androidInfo;
        if (int.parse("${osVersion.version.release}") > 10) {
          if (await _reqPermission(Permission.storage)) {
            directory = await getExternalStorageDirectory();
            print(directory?.path);

            newPath.value = "${directory?.path}/AbpEnergy/Musik";
            directory = Directory(newPath.value);
          } else {
            print("error1");
            return false;
          }
        } else {
          if (await _reqPermission(Permission.storage)) {
            directory = await getExternalStorageDirectory();
            print(directory?.path);
            List<String>? folders = directory?.path.split("/");
            for (int x = 1; x < folders!.length; x++) {
              String folder = folders[x];
              if (folder != "Android") {
                newPath.value += "/$folder";
              } else {
                break;
              }
            }
            newPath.value = "${newPath.value}/AbpEnergy/Musik";
            directory = Directory(newPath.value);
          } else {
            print("error3");
            return false;
          }
        }
      } else {
        directory = await getTemporaryDirectory();
      }
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File saveFile = File("${directory.path}/$namaFile");

        if (await saveFile.exists()) {
          await saveFile.delete();
        }
        await dio.download(url, saveFile.path,
            options: Options(headers: {HttpHeaders.acceptEncodingHeader: "*"}),
            onReceiveProgress: (downloaded, totalSize) {
          progress.value = (downloaded / totalSize) * 100;
          print("loading ${progress.value}");
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
    } catch (e) {
      print("Error $e");
    }
    print("error2");

    return false;
  }
}
