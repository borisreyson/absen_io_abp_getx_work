import 'dart:io';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../data/models/kemungkinan_model.dart';
import '../../../../data/models/keparahan_model.dart';
import '../../../../data/models/lokasi_model.dart';
import '../../../../data/models/metrik_resiko_model.dart';
import '../../../../data/models/pengendalian.dart';
import '../../../../data/models/perusahaan_model.dart';
import '../../../../data/models/users_model.dart';
import '../../../../data/utils/background.dart';
import '../../../../data/utils/constants.dart';
import '../controllers/form_hazard_controller.dart';

class FormHazardView extends GetView<FormHazardController> {
  const FormHazardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: controller.formKey,
            autovalidateMode: controller.autovalidateMode,
            child: Stack(
              children: [
                Background(
                  topPrimary: const Color(0xff115923),
                  topSecondary: const Color(0xff2B8C44),
                  bottomPrimary: const Color.fromARGB(255, 191, 112, 27),
                  bottomSecondary: const Color(0xffBF3E21),
                  bgColor: Colors.grey.shade400,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: ListView(
                    children: [
                      dataTemuan(context),
                      deskBahaya(),
                      resikoSebelum(),
                      katBahaya(),
                      tindakanPerbaikan(),
                      statusPerbaikan(context),
                      perbaikanWidget(),
                      optionPJ(),
                      // ignore: unrelated_type_equality_checks
                      (controller.pjOption == 1) ? pjAuto() : pjManual(context),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                backButton(context),
                btnAksi(),
              ],
            ),
          ),
        ));
  }

  Widget perbaikanWidget() {
    return Visibility(
      visible: (controller.perbaikanInt.value == 1),
      child: Column(
        children: [
          fotoPerbaikan(),
          ketPerbaikan(),
          resikoSesudah(),
        ],
      ),
    );
  }

  Widget backButton(context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.only(top: 30, left: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            Navigator.pop(context, false);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: const [
                Positioned(
                  left: 2.0,
                  top: 2.5,
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      color: Color.fromARGB(135, 169, 166, 166)),
                ),
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF943016),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dataTemuan(context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
      child: Column(
        children: [
          fotoBukti(),
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "1. Data Temuan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //Perusahaan
                      TextFormField(
                        onTap: () async {
                          Company company =
                              await Get.toNamed(Routes.PERUSAHAAN);
                          controller.perusahaan.text =
                              "${company.namaPerusahaan}";
                        },
                        autofocus: false,
                        readOnly: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Perusahaan",
                          hintText: "Perusahaan",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Perusahaan Wajib Di Isi';
                          }
                          return null;
                        },
                        controller: controller.perusahaan,
                      ),
                      spacing(10),
                      //Tanggal
                      TextFormField(
                        onTap: () async {
                          var tgl = await controller.selectDate(
                              context, controller.tglHazard.value);
                          if (tgl != null) {
                            controller.tglController.text =
                                controller.fmt.format(tgl);
                          }
                        },
                        controller: controller.tglController,
                        autofocus: false,
                        readOnly: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Tanggal",
                          hintText: "Tanggal",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tanggal Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                      spacing(10),
                      //Jam
                      TextFormField(
                        onTap: () async {
                          controller.dt = DateTime.now();
                          controller.jamHazard.value = controller.dt;
                          var jam = await controller.seletTime(
                              context, controller.jamHazard.value);
                          if (jam != null) {
                            controller.jamController.text =
                                "${jam.hour.toString().padLeft(2, '0')} : ${jam.minute.toString().padLeft(2, '0')}";
                          }
                        },
                        controller: controller.jamController,
                        autofocus: false,
                        readOnly: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Jam",
                          hintText: "Jam",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Jam Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                      spacing(10),
                      //lokasi
                      TextFormField(
                        onTap: () async {
                          Lokasi lokasi =
                              await Get.toNamed(Routes.LOKASI_HAZARD);
                          controller.lokasi.text = "${lokasi.lokasi}";
                          controller.idLokasi.value = lokasi.idLok!;
                        },
                        controller: controller.lokasi,
                        autofocus: false,
                        readOnly: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Lokasi",
                          hintText: "Lokasi",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lokasi Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                      spacing(10),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        maxLines: 3,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Detail Lokasi",
                          alignLabelWithHint: true,
                          hintText: "Detail Lokasi",
                        ),
                        controller: controller.detailLokasi,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Detail Lokasi Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                      spacing(10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget deskBahaya() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "2. Deskripsi Bahaya",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        maxLines: 10,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          alignLabelWithHint: true,
                          labelText: "Deskripsi Bahaya",
                          hintText: "Deskripsi Bahaya",
                        ),
                        controller: controller.deskBahaya,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Deskripsi Bahaya Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fotoBukti() {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 10,
      child: InkWell(
        onTap: () async {
          controller.buktiPicker();
        },
        child: SizedBox(
            width: Get.width,
            height: 200,
            child: (controller.urlFoto.value != null)
                ? Image.file(
                    File(
                      controller.urlFoto.value!,
                    ),
                    fit: BoxFit.fitWidth,
                  )
                : const Icon(
                    Icons.image_rounded,
                    size: 100,
                  )),
      ),
    );
  }

  Widget resikoSebelum() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  color: Colors.orange.shade700,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Kemungkinan Resiko",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        onTap: () async {
                          Kemungkinan data =
                              await Get.toNamed(Routes.KEMUNGKINAN);
                          controller.nilaiKmSebelum.value = data.nilai!;
                          if (controller.nilaiKpSebelum.value > 0) {
                            controller.loadMetrik(
                                controller.nilaiKmSebelum.value,
                                controller.nilaiKpSebelum.value);
                          }
                          controller.idKmSebelum.value = data.idKemungkinan!;
                          controller.kemungkinan.text = "${data.kemungkinan}";
                        },
                        controller: controller.kemungkinan,
                        autofocus: false,
                        readOnly: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Kemungkinan Resiko",
                          hintText: "Kemungkinan Resiko",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Kemungkinan Resiko Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.red.shade700,
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Keparahan Resiko",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        controller: controller.keparahan,
                        onTap: () async {
                          Keparahan data = await Get.toNamed(Routes.KEPARAHAN);
                          controller.nilaiKpSebelum.value = data.nilai!;
                          controller.loadMetrik(
                              controller.nilaiKmSebelum.value,
                              controller.nilaiKpSebelum.value);
                          controller.idKpSebelum.value = data.idKeparahan!;
                          controller.keparahan.text = "${data.keparahan}";
                        },
                        autofocus: false,
                        readOnly: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Keparahan Resiko",
                          hintText: "Keparahan Resiko",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Keparahan Resiko Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          (controller.nilaiKmSebelum.value > 0 &&
                  controller.nilaiKpSebelum.value > 0)
              ? metrikWidget(controller.resikoSebelum.value)
              : Container(),
        ],
      ),
    );
  }

  Widget metrikWidget(MetrikResiko data) {
    var bgColor = int.parse("0xffffffff");
    var txtColor = int.parse("0xffffffff");
    if (data.bgColor != null && data.txtColor != null) {
      bgColor = int.parse(data.bgColor!.replaceAll("#", "0xff"));
      txtColor = int.parse(data.txtColor!.replaceAll("#", "0xff"));
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: Get.width,
      child: Material(
        color: Color(bgColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${data.kodeBahaya}",
                style: TextStyle(
                  color: Color(txtColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${data.kategori}",
                style: TextStyle(
                  color: Color(txtColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${data.min} - ${data.max}",
                style: TextStyle(
                  color: Color(txtColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget katBahaya() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "3. Kategori Bahaya ( Pilih Salah Satu )",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: controller.kta.value,
                  onChanged: (value) {
                    controller.kta.value = int.parse("$value");
                  },
                  title: const Text("KONDISI TIDAK AMAN"),
                ),
                RadioListTile(
                  value: 2,
                  groupValue: controller.kta.value,
                  onChanged: (value) {
                    controller.kta.value = int.parse("$value");
                  },
                  title: const Text("TINDAKAN TIDAK AMAN"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        autofocus: false,
                        readOnly: true,
                        onTap: () async {
                          Hirarki data = await Get.toNamed(Routes.PENGENDALIAN);
                          controller.idPengendalian.value = data.idHirarki!;
                          controller.pengendalian.text =
                              "${data.namaPengendalian}";
                        },
                        controller: controller.pengendalian,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Pengendalian",
                          hintText: "Pengendalian",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Pengendalian Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tindakanPerbaikan() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "4. Tindakan Yang Dilakukan Untuk Perbaikan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        maxLines: 10,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          alignLabelWithHint: true,
                          labelText: "Tindakan Perbaikan",
                          hintText: "Tindakan Perbaikan",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        controller: controller.tindakan,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tindakan Perbaikan Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget statusPerbaikan(context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Status Perbaikan ( Pilih Salah Satu )",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: controller.perbaikanInt.value,
                  onChanged: (value) {
                    controller.perbaikanInt.value = int.parse("$value");
                  },
                  title: const Text("Selesai"),
                ),
                RadioListTile(
                  value: 2,
                  groupValue: controller.perbaikanInt.value,
                  onChanged: (value) {
                    controller.perbaikanInt.value = int.parse("$value");
                  },
                  title: const Text("Belum Selesai"),
                ),
                RadioListTile(
                  value: 3,
                  groupValue: controller.perbaikanInt.value,
                  onChanged: (value) {
                    controller.perbaikanInt.value = int.parse("$value");
                  },
                  title: const Text("Dalam Pengerjaan"),
                ),
                RadioListTile(
                  value: 4,
                  groupValue: controller.perbaikanInt.value,
                  onChanged: (value) {
                    controller.perbaikanInt.value = int.parse("$value");
                  },
                  title: const Text("Berlanjut"),
                ),
                Visibility(
                  visible: (controller.perbaikanInt.value == 1) ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          autofocus: false,
                          readOnly: true,
                          controller: controller.tenggat,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: controller.warna)),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: controller.warna)),
                            labelStyle: TextStyle(color: controller.warna),
                            labelText: "Tanggal Tenggat",
                            hintText: "Tanggal Tenggat",
                          ),
                          onSaved: (value) {},
                          onFieldSubmitted: (term) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tanggal Tenggat Wajib Di Isi';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: (controller.perbaikanInt.value == 1) ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          onTap: () async {
                            var tgl = await controller.selectDate(
                                context, controller.tglHazardSelesai.value);
                            if (tgl != null) {
                              controller.tglSelesai.text =
                                  controller.fmt.format(tgl);
                            }
                          },
                          autofocus: false,
                          readOnly: true,
                          controller: controller.tglSelesai,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: controller.warna)),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: controller.warna)),
                            labelStyle: TextStyle(color: controller.warna),
                            labelText: "Tanggal Selesai",
                            hintText: "Tanggal Selesai",
                          ),
                          onSaved: (value) {},
                          onFieldSubmitted: (term) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tanggal Selesai Wajib Di Isi';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onTap: () async {
                            var jam = await controller.seletTime(
                                context, controller.jamHazardSelesai.value);
                            if (jam != null) {
                              controller.jamSelesai.text =
                                  "${jam.hour.toString().padLeft(2, '0')} : ${jam.minute.toString().padLeft(2, '0')}";
                            }
                          },
                          autofocus: false,
                          readOnly: true,
                          controller: controller.jamSelesai,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: controller.warna)),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: controller.warna)),
                            labelStyle: TextStyle(color: controller.warna),
                            labelText: "Jam Selesai",
                            hintText: "Jam Selesai",
                          ),
                          onSaved: (value) {},
                          onFieldSubmitted: (term) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Jam Selesai Wajib Di Isi';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fotoPerbaikan() {
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      elevation: 10,
      child: InkWell(
        onTap: () async {
          controller.perbaikanPicker();
        },
        child: SizedBox(
          width: Get.width,
          height: 200,
          child: (controller.urlperbaikan.value != null)
              ? Image.file(
                  File(
                    controller.urlperbaikan.value!,
                  ),
                  fit: BoxFit.fitWidth,
                )
              : const Icon(Icons.image_rounded, size: 100),
        ),
      ),
    );
  }

  Widget ketPerbaikan() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Keterangan Perbaikan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        maxLines: 10,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          alignLabelWithHint: true,
                          labelText: "Keterangan Penanggung Jawab",
                          hintText: "Keterangan Penanggung Jawab",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Keterangan Penanggung Jawab Wajib Di Isi';
                          }
                          return null;
                        },
                        controller: controller.keteranganPJ,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget resikoSesudah() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  color: Colors.orange.shade700,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Kemungkinan Resiko",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        onTap: () async {
                          Kemungkinan data =
                              await Get.toNamed(Routes.KEMUNGKINAN);
                          controller.nilaiKmSesudah.value = data.nilai!;
                          if (controller.nilaiKpSesudah.value > 0) {
                            controller.loadMetrikSesudah(
                                controller.nilaiKmSesudah.value,
                                controller.nilaiKpSesudah.value);
                          }
                          controller.idKmSesudah.value = data.idKemungkinan!;
                          controller.kemungkinanSesudah.text =
                              "${data.kemungkinan}";
                        },
                        controller: controller.kemungkinanSesudah,
                        autofocus: false,
                        readOnly: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Kemungkinan Resiko",
                          hintText: "Kemungkinan Resiko",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Kemungkinan Resiko Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.red.shade700,
                  child: Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Keparahan Resiko",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextFormField(
                        onTap: () async {
                          Keparahan data = await Get.toNamed(Routes.KEPARAHAN);
                          controller.nilaiKpSesudah.value = data.nilai!;
                          if (controller.nilaiKmSesudah > 0) {
                            controller.loadMetrikSesudah(
                                controller.nilaiKmSesudah.value,
                                controller.nilaiKpSesudah.value);
                          }
                          controller.idKpSesudah.value = data.idKeparahan!;
                          controller.keparahanSesudah.text =
                              "${data.keparahan}";
                        },
                        controller: controller.keparahanSesudah,
                        autofocus: false,
                        readOnly: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: controller.warna)),
                          labelStyle: TextStyle(color: controller.warna),
                          labelText: "Keparahan Resiko",
                          hintText: "Keparahan Resiko",
                        ),
                        onSaved: (value) {},
                        onFieldSubmitted: (term) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Keparahan Resiko Wajib Di Isi';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          (controller.idKmSesudah > 0 && controller.idKpSesudah > 0)
              ? metrikWidgetSesudah(controller.resikoSesudah.value)
              : Container(),
        ],
      ),
    );
  }

  Widget metrikWidgetSesudah(MetrikResiko data) {
    var bgColor = int.parse("0xffffffff");
    var txtColor = int.parse("0xffffffff");
    if (data.bgColor != null && data.txtColor != null) {
      bgColor = int.parse(data.bgColor!.replaceAll("#", "0xff"));
      txtColor = int.parse(data.txtColor!.replaceAll("#", "0xff"));
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: Get.width,
      child: Material(
        color: Color(bgColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${data.kodeBahaya}",
                style: TextStyle(
                  color: Color(txtColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${data.kategori}",
                style: TextStyle(
                  color: Color(txtColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${data.min} - ${data.max}",
                style: TextStyle(
                  color: Color(txtColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget optionPJ() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Column(
              children: [
                RadioListTile(
                  value: 1,
                  groupValue: controller.pjOption.value,
                  onChanged: (value) {
                    controller.pjOption.value = int.parse("$value");
                  },
                  title: const Text("Pilih Penanggung Jawab"),
                ),
                RadioListTile(
                  value: 2,
                  groupValue: controller.pjOption.value,
                  onChanged: (value) {
                    controller.pjOption.value = int.parse("$value");
                  },
                  title: const Text("Input Manual Penanggung Jawab"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pjAuto() {
    return Stack(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10,
          margin:
              const EdgeInsets.only(top: 10, bottom: 20, right: 20, left: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: (controller.urlImgPj.value != null)
                                ? Image.file(
                                    File(controller.urlImgPj.value!),
                                    fit: BoxFit.cover,
                                    width: 100,
                                  )
                                : const Icon(Icons.person, size: 100),
                          ))),
                ),
              ),
              Container(
                width: Get.width,
                color: Colors.blue,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Penanggung Jawab",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(2.5)
                  },
                  children: [
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Nama"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(": ${controller.namaPj.text.toString()}"),
                      ),
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("NIK / NRP"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(": ${controller.nikPJ.text.toString()}"),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            margin: const EdgeInsets.only(top: 30, right: 30),
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () async {
                UsersList data = await Get.toNamed(Routes.LIST_USER);
                var temp = await getTemporaryDirectory();
                var path = temp.path;

                if (data.photoProfile != null) {
                  var fName =
                      '$path${data.nik!}_${data.username!}.jpg';
                  File file = File(fName);
                  var res = await http.get(Uri.parse(data.photoProfile!));
                  await file.writeAsBytes(res.bodyBytes);
                  controller.imgPj = XFile(file.path);
                  controller.urlImgPj.value = file.path;
                  controller.namaPj.text = "${data.namaLengkap}";
                  controller.nikPJ.text = "${data.nik}";
                } else {
                  Constants().showAlert(
                      judul: "Error",
                      msg: "Foto Penanggung Jawab Tidak Ada, Input Manual!");
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget pjManual(context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      margin: const EdgeInsets.only(top: 10, bottom: 20, right: 20, left: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () async {
                  controller.pjPicker();
                },
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: (controller.urlImgPj.value != null)
                            ? Image.file(
                                File(
                                  controller.urlImgPj.value!,
                                ),
                                fit: BoxFit.cover,
                                width: 100,
                              )
                            : const Icon(
                                Icons.person_add_alt_sharp,
                                size: 80,
                              ),
                      )),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Penanggung Jawab",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: controller.warna)),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: controller.warna)),
                labelStyle: TextStyle(color: controller.warna),
                labelText: "Nama",
                hintText: "Nama",
              ),
              controller: controller.namaPj,
              onSaved: (value) {},
              onFieldSubmitted: (term) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nama Wajib Di Isi';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: controller.warna)),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: controller.warna)),
                labelStyle: TextStyle(color: controller.warna),
                labelText: "NIK / NRP",
                hintText: "NIK / NRP",
              ),
              onSaved: (value) {},
              onFieldSubmitted: (term) {},
              controller: controller.nikPJ,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'NIK / NRP Wajib Di Isi';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget btnAksi() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Card(
                color: Colors.blue.shade700,
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    controller.submit();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.red.shade700,
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Get.back(result: false);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Batal",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget spacing(double i) {
    return SizedBox(
      height: i,
    );
  }
}
