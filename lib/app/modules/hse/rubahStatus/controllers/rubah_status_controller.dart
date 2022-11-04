import 'dart:io';
import 'package:face_id_plus/app/data/models/metrik_resiko_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../../../../data/models/data_hazard.dart';
import '../../../../data/models/hazard_model.dart';
import '../../../../data/repository/repository_api.dart';
import '../../../../data/services/service.dart';
import '../../../../data/utils/constants.dart';

class RubahStatusController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final _repository = HazardPostRepository();
  var imagePicker = ImagePicker();
  final detail = Data().obs;
  XFile? foto;
  final Color warna = const Color(0xFF591505);

  final keteranganPJ = TextEditingController();
  final kemungkinanSesudah = TextEditingController();
  final keparahanSesudah = TextEditingController();
  final tglSelesai = TextEditingController();
  final jamSelesai = TextEditingController();

  final nilaiKmSesudah = 0.obs, nilaiKpSesudah = 0.obs;
  String? idDevice;
  final imgPerbaikan = ''.obs;

  final idKmSesudah = 0.obs, idKpSesudah = 0.obs, total = 0.obs;

  DateTime dt = DateTime.now();
  DateFormat fmt = DateFormat('dd MMMM yyyy');

  final tglSelesaiDT = DateTime.now().obs;
  final jamSelesaiDT = DateTime.now().obs;

  final resiko = MetrikResiko().obs;

  @override
  void onInit() async {
    initIdDevice();
    detail.value = await Get.arguments['detail'];
    super.onInit();
  }


  @override
  void onClose() {}
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

  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, maxTime: dt, currentTime: initDate);
  }

  Future<DateTime?> seletTime(BuildContext context, DateTime jamHazard) async {
    return await DatePicker.showTimePicker(context,
        showTitleActions: true, currentTime: jamHazard);
  }

  submit(context) async {
    if (foto != null) {
      if (formKey.currentState!.validate()) {
        upload();
      }
    } else {
      await Constants().showAlert(
        judul: "Error Foto Perbaikan Tidak ada",
        msg: "Foto Perbaikan Tidak Boleh Kosong!",
      );
      buktiPicker(context);
    }
  }

  upload() async {
    Constants().showAlert(
      dismiss: false,
      loading: true,
      enBtn: false,
    );
    HazardUpdate data = HazardUpdate();
    data.fileToUpload = File(foto!.path);
    data.uid = detail.value.uid;
    data.tglSelesai = tglSelesai.text;
    data.jamSelesai = jamSelesai.text;
    data.idKemungkinanSesudah = "${idKmSesudah.value}";
    data.idKeparahanSesudah = "${idKpSesudah.value}";
    data.keterangan = keteranganPJ.text;
    try {
      await _repository.postUpdateHazard(data, idDevice).then((res) {
        if (res != null) {
          if (res.success) {
            Get.back(result: res.success);
            Get.back(result: res.success);
          } else {
            Get.back(result: false);
          }
        }
      });
    } on HttpException {
      if (kDebugMode) {
        print("$HttpException");
      }
      Get.back(result: false);
    }
  }

  buktiPicker(context) async {
    XFile? bukti = await pickerBtmSheet(context);
    if (bukti != null) {
      foto = bukti;
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
                                Constants().showAlert(
                                  dismiss: false,
                                  loading: true,
                                  enBtn: false,
                                );
                                XFile? img = await getImageCamera();
                                if (img != null) {
                                  imgPerbaikan.value = img.path;
                                  Get.back(result: img);
                                  Get.back(result: img);
                                } else {
                                  Get.back();
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
                                Constants().showAlert(
                                  dismiss: false,
                                  loading: true,
                                  enBtn: false,
                                );
                                XFile? img = await getImageGallery();
                                if (img != null) {
                                  imgPerbaikan.value = img.path;
                                  Get.back(result: img);
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

  loadMetrikSesudah(nilaiKM, nilaiKP) async {
    var service = MetrikService();
    total.value = nilaiKM * nilaiKP;
    if (kDebugMode) {
      print("resiko = ${total.value}");
    }

    await service.getBy(nilai: total.value).then((value) {
      resiko.value = value;
    });
  }
}
