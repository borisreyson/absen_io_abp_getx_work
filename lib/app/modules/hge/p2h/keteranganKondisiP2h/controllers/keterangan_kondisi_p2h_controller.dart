import 'dart:io';
import 'package:face_id_plus/app/data/models/p2h_sarana_mode.dart';
import 'package:face_id_plus/app/data/providers/p2h_provider.dart';
import 'package:face_id_plus/app/data/services/service.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/models/master_pemeriksaan_model.dart';

class KeteranganKondisiP2hController extends GetxController {
  final provider = P2hProvider();
  final formKey = GlobalKey<FormState>();
  final serviceTemuan = P2HTemuanPemeriksaanService();
  final serviceKondisi = P2HKondisiService();
  final data = MasterPemeriksaan().obs;
  final header = P2HSaranaModel().obs;
  final keteranganKondisiCtrl = TextEditingController().obs;
  final loaded = false.obs;
  var imagePicker = ImagePicker();
  final username = RxnString(null);
  final fileName = RxnString(null);
  final getFileName = RxnString(null);
  final idDevice = RxnString(null);
  @override
  void onInit() async {
    
    await initIdDevice();
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
    var res = await Get.arguments['data'];
    var result = await Get.arguments['header'];
    if (res != null && result != null) {
      data.value = res;
      header.value = result;
      loaded.value = true;
    } else {
      loaded.value = false;
    }
    super.onInit();
  }

  initIdDevice() async {
    try {
      var id = await PlatformDeviceId.getDeviceId;
      idDevice.value = "$id";
    } on PlatformException {
      if (kDebugMode) {
        print("ERROR");
      }
    }
  }

  void saveKondisi() async {
    if (formKey.currentState!.validate()) {
      var pm = P2HPemeriksaanModel();
      pm.idHeader = header.value.idHeader;
      pm.idDetail = data.value.idPemeriksaan;
      pm.kondisi = "tidak_baik";
      pm.keterangan = keteranganKondisiCtrl.value.text;
      pm.gambar = getFileName.value;
      var res = await serviceKondisi.saveKeterangan(pm);
      var res1 = await serviceTemuan.save(pm);
      if (res > 0 && res1 > 0) {
        Get.back(result: true);
        Get.snackbar("Berhasil", "Data Telah Di Submit",
            colorText: Colors.white, backgroundColor: Colors.green);
      } else {
        Get.snackbar("Gagal", "Gagal Submit Data , Coba Lagi",
            colorText: Colors.white, backgroundColor: Colors.red);
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
      var fileP2h = File(buktiFile.path);
      fileName.value = fileP2h.path;
      await provider
          .postFileP2h(fileP2h, username.value, idDevice: idDevice.value)
          .then((value) {
        var success = value?.success;
        if (success != null && success) {
          getFileName.value = value?.fileName;

          Get.back();
        } else {
          Get.back();
        }
      });
    } else {
      Get.back();
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
