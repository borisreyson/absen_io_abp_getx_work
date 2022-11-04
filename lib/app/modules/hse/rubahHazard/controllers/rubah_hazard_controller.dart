import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../../data/models/data_hazard.dart';
import '../../../../data/models/hazard_model.dart';
import '../../../../data/models/kemungkinan_model.dart';
import '../../../../data/models/keparahan_model.dart';
import '../../../../data/models/metrik_resiko_model.dart';
import '../../../../data/models/pengendalian.dart';
import '../../../../data/repository/repository_api.dart';
import '../../../../data/services/service.dart';
import '../../../../data/utils/constants.dart';
import '../../../../routes/app_pages.dart';

class RubahHazardController extends GetxController {
  final repository = HazardRepository();
  final KemungkinanService _kmService = KemungkinanService();
  final KeparahanService _kpService = KeparahanService();
  final MetrikService _metrikService = MetrikService();
  final String baseImage = "https://abpjobsite.com/bukti_hazard/";
  String perusahaan = "Perusahaan";
  String? idDevice;
  final data = Data().obs;
  int? nilaiKpSebelum, nilaiKmSesudah, nilaiKpSesudah;
  var imagePicker = ImagePicker();
  XFile? foto, perbaikan, imgPj;
  final resikoSebelum = MetrikResiko().obs;
  final resikoSesudah = MetrikResiko().obs;
  final kmSebelum = Kemungkinan().obs;
  final kpSebelum = Keparahan().obs;
  final kmSesudah = Kemungkinan().obs;
  final kpSesudah = Keparahan().obs;
  final bukti = RxnString(null);
  final updateBukti = RxnString(null);

  @override
  void onInit() async {
    initIdDevice();
    foto = null;
    perbaikan = null;
    imgPj = null;
    data.value = Get.arguments['detail'];
    updateBukti.value = "${baseImage}update/${data.value.updateBukti}";
    _getResikoSebelum(data: data.value);
    _getResikoSesudah(data: data.value);
    super.onInit();
  }

  initIdDevice() async {
    String? idDevice;
    try {
      idDevice = await PlatformDeviceId.getDeviceId;
      idDevice = idDevice;
    } on PlatformException {
      if (kDebugMode) {
        print("ERROR");
      }
    }
  }

  @override
  void onReady() {
    if (kDebugMode) {
      print("bukti ${data.value.bukti}");
    }
    bukti.value = "$baseImage${data.value.bukti}";

    updateBukti.value = "${baseImage}update/${data.value.updateBukti}";
    super.onReady();
  }

  @override
  void onClose() {}

  _getResikoSebelum({required Data data}) async {
    kmSebelum.value = await _kmService.getBy(idKemungkinan: data.idKemungkinan);
    kpSebelum.value = await _kpService.getBy(idKeparahan: data.idKeparahan);
    resikoSebelum.value = await _metrikService.getBy(
        nilai: (kmSebelum.value.nilai! * kpSebelum.value.nilai!));
  }

  _getResikoSesudah({required Data data}) async {
    kmSesudah.value =
        await _kmService.getBy(idKemungkinan: data.idKemungkinanSesudah);
    kpSesudah.value =
        await _kpService.getBy(idKeparahan: data.idKeparahanSesudah);
    resikoSesudah.value = await _metrikService.getBy(
        nilai: (kmSesudah.value.nilai! * kpSesudah.value.nilai!));
  }

  reload() async {
    Constants().showAlert(
      dismiss: false,
      loading: true,
      enBtn: false,
    );
    var uid = data.value.uid;
    await repository.getHazardDetail(uid).then((res) {
      if (res != null) {
        data.value = res;
        _getResikoSebelum(data: data.value);
        _getResikoSesudah(data: data.value);
        Get.back(result: true);
      } else {
        Get.back(result: false);
      }
    });
  }

  buktiPicker(context) async {
    Constants().showAlert(
      dismiss: false,
      loading: true,
      enBtn: false,
    );
    XFile? buktiFile = await pickerBtmSheet(context);

    if (buktiFile != null) {
      var result = HazardGambarBukti();
      result.buktiSebelum = File(buktiFile.path);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        result.uid = data.value.uid;
      } else {
        Get.back(result: false);
      }
      await repository.postGambarBukti(result, idDevice).then((response) async {
        if (response != null) {
          if (response.success) {
            if (kDebugMode) {
              print("uid : ${result.uid}");
            }
            await repository.getHazardDetail(data.value.uid).then((res) {
              if (kDebugMode) {
                print("idDevice $res");
              }

              if (res != null) {
                bukti.value = "$baseImage${res.bukti}";
                if (kDebugMode) {
                  print("data");
                }
                Get.back(result: true);
              } else {
                if (kDebugMode) {
                  print("error");
                }
                Get.back(result: false);
              }
            });
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

  perbaikanPicker(context) async {
    Constants().showAlert(
      dismiss: false,
      loading: true,
      enBtn: false,
    );
    XFile? imgPerbaikan = await pickerBtmSheet(context);

    if (imgPerbaikan != null) {
      var postData = HazardGambarPerbaikan();
      postData.buktiSelesai = File(imgPerbaikan.path);
      // ignore: unnecessary_null_comparison
      if (data.value != null) {
        postData.uid = data.value.uid;
      } else {
        Get.back(result: false);
      }
      await repository
          .postGambarPerbaikan(postData, idDevice)
          .then((response) async {
        if (response != null) {
          if (response.success) {
            if (kDebugMode) {
              print("uid : ${postData.uid}");
            }
            await repository.getHazardDetail(postData.uid).then((res) {
              if (res != null) {
                updateBukti.value = "${baseImage}update/${res.updateBukti}";

                if (kDebugMode) {
                  print("data ${res.updateBukti}");
                }
                Get.back(result: true);
              } else {
                if (kDebugMode) {
                  print("error");
                }
                Get.back(result: false);
              }
            });
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

  pickerBtmSheet(context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 220,
            child: Stack(
              children: [
                Card(
                  margin: const EdgeInsets.only(top: 40),
                  color: Colors.white,
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 8, right: 8),
                      child: ListView(
                        children: [
                          Card(
                            elevation: 10,
                            child: InkWell(
                              onTap: () async {
                                var img = await getImageCamera();
                                if (img != null) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context, img);
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
          );
        });
  }

  Future<XFile?> getImageGallery() async {
    var imageFile = await imagePicker.pickImage(source: ImageSource.gallery);
    return imageFile;
  }

  Future<XFile?> getImageCamera() async {
    var imageFile = await imagePicker.pickImage(source: ImageSource.camera);
    return imageFile;
  }

  void ubahKemungkinan(String tipeKemungkinan) async {
    Constants().showAlert(
      dismiss: false,
      loading: true,
      enBtn: false,
    );
    Kemungkinan kemungkinan = await Get.toNamed(Routes.KEMUNGKINAN);

    await repository
        .postUpdateResiko(
            data.value.uid, tipeKemungkinan, "${kemungkinan.idKemungkinan}")
        .then((result) {
      if (result != null) {
        Get.back();
        if (result.success) {
          reload();
        } else {
          Constants().showAlert(
            judul: "Error",
            msg: "Gagal Mengupdate Resiko Kemungkinan!",
          );
        }
      } else {
        Constants().showAlert(
          judul: "Error",
          msg: "Gagal Mengupdate Resiko Kemungkinan!",
        );
      }
    });
  }

  void ubahKeparahan(String tipeKeparahan) async {
    Keparahan keparahan = await Get.toNamed(Routes.KEPARAHAN);
    await repository
        .postUpdateResiko(
            data.value.uid, tipeKeparahan, "${keparahan.idKeparahan}")
        .then((result) {
      if (result != null) {
        if (result.success) {
          reload();
        } else {
          Constants().showAlert(
            judul: "Error",
            msg: "Gagal Mengupdate Resiko Kemungkinan!",
          );
        }
      } else {
        Constants().showAlert(
          judul: "Error",
          msg: "Gagal Mengupdate Resiko Kemungkinan!",
        );
      }
    });
  }

  ubahKategoriBahaya() async {
    String katBahaya = await Get.toNamed(Routes.RUBAH_K_T_A);
    await repository
        .postUpdateKatBahaya(data.value.uid, katBahaya)
        .then((result) {
      if (result != null) {
        if (result.success) {
          reload();
        } else {
          Constants().showAlert(
            judul: "Error",
            msg: "Gagal Mengupdate Kategori Bahaya!",
          );
        }
      } else {
        Constants().showAlert(
          judul: "Error",
          msg: "Gagal Mengupdate Kategori Bahaya!",
        );
      }
    });
  }

  ubahPengendalian() async {
    Hirarki pengendalian = await Get.toNamed(Routes.PENGENDALIAN);
    await repository
        .postUpdatePengendalian(data.value.uid, "${pengendalian.idHirarki}")
        .then((result) {
      if (result != null) {
        if (result.success) {
          reload();
        } else {
          Constants().showAlert(
            judul: "Error",
            msg: "Gagal Mengupdate Resiko Pengendalian!",
          );
        }
      } else {
        Constants().showAlert(
          judul: "Error",
          msg: "Gagal Mengupdate Resiko Pengendalian!",
        );
      }
    });
  }
}
