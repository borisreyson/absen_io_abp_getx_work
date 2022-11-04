import 'dart:io';
import 'package:face_id_plus/app/data/providers/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/models/hazard_post.dart';
import '../../../../data/utils/constants.dart';

class GantiFotoController extends GetxController {
  final repository = Provider();
  final foto = RxnString(null);
  var imagePicker = ImagePicker();
  final file = RxnString(null);
  final username = RxnString(null);
  final fineNull = false.obs;
  String? idDevice;

  @override
  void onInit() async {
    var pic = await Get.arguments["foto"];
    if (pic != null) {
      foto.value = pic;
    }
    var newFoto = await Get.arguments["baru"];
    if (newFoto != null) {
      fineNull.value = newFoto;
    }
    initIdDevice();
    super.onInit();
  }

  initIdDevice() async {
    String? idDevice;
    try {
      idDevice = await PlatformDeviceId.getDeviceId;
      idDevice = idDevice;
      var pref = await SharedPreferences.getInstance();
      username.value = pref.getString(Constants.username);
    } on PlatformException {
      if (kDebugMode) {
        print("ERROR");
      }
    }
  }

  buktiPicker() async {
    Constants().showAlert(
      dismiss: false,
      loading: true,
      enBtn: false,
    );
    XFile? buktiFile = await pickerBtmSheet();
    if (buktiFile != null) {
      var result = PostFotoProfile();
      result.fotoProfile = File(buktiFile.path);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        if (kDebugMode) {
          print("result : a");
        }

        result.username = username.value;
      } else {
        if (kDebugMode) {
          print("result : b");
        }

        Get.back(result: false);
      }
      await repository.postFotoProfile(result, idDevice).then((response) async {
        if (kDebugMode) {
          print("result : $response");
        }

        if (response != null) {
          if (response.success) {
            if (kDebugMode) {
              print("username : ${response.fileName}");
            }
            foto.value = "${response.fileName}";
            var pref = await SharedPreferences.getInstance();
            pref.setString(Constants.fotoProfile, "${response.fileName}");
            Get.back(result: true);
            if (kDebugMode) {
              print("error");
            }
          } else {
            if (kDebugMode) {
              print("error 1");
            }
            Get.back(result: false);
          }
        } else {
          if (kDebugMode) {
            print("error 2");
          }
          Get.back(result: false);
        }
      }).catchError((onError) {
        if (kDebugMode) {
          print("error 3 $onError");
        }
        Get.back(result: false);
      });
    } else {
      if (kDebugMode) {
        print("error 4");
      }
      Get.back(result: false);
    }
  }

  pickerBtmSheet() {
    return Get.bottomSheet(
        SizedBox(
          height: 220,
          child: Stack(
            children: [
              Card(
                margin: const EdgeInsets.only(top: 40),
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                    child: ListView(
                      children: [
                        Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () async {
                              var img = await getImageCamera();
                              if (img != null) {
                                Get.back(result: img);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.camera_alt_rounded,
                                  ),
                                  Text("Camera"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () async {
                              var img = await getImageGallery();
                              if (img != null) {
                                Get.back(result: img);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(Icons.image_search_rounded),
                                  Text("Galeri"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        customBorder: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        useRootNavigator: true);
  }

  Future<XFile?> getImageGallery() async {
    var imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
    return imageFile;
  }

  Future<XFile?> getImageCamera() async {
    var imageFile = await imagePicker.pickImage(source: ImageSource.camera);
    return imageFile;
  }
}
