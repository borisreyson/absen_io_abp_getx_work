import 'dart:io';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/kemungkinan_model.dart';
import '../../../../data/models/keparahan_model.dart';
import '../../../../data/models/metrik_resiko_model.dart';
import '../controllers/rubah_status_controller.dart';

class RubahStatusView extends GetView<RubahStatusController> {
  const RubahStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Update Hazard"),
          leading: IconButton(
              onPressed: () {
                Get.back(result: false);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Form(
          key: controller.formKey,
          child: Stack(
            children: [
              ListView(
                children: [
                  fotoBukti(context, controller.imgPerbaikan.value),
                  ketPerbaikan(),
                  statusPerbaikan(context),
                  resikoSesudah(),
                  spacing(80),
                ],
              ),
              btnAksi(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget fotoBukti(context, urlImg) {
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      elevation: 10,
      child: InkWell(
        onTap: () async {
          controller.buktiPicker(context);
        },
        child: SizedBox(
          width: Get.width,
          height: 200,
          child: (controller.foto != null)
              ? Image.file(
                  File(
                    urlImg,
                  ),
                  fit: BoxFit.fitWidth,
                )
              : const Icon(
                  Icons.add_a_photo_rounded,
                  size: 100,
                ),
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
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                      child: Text(
                        "Waktu Penyelesaian",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: () async {
                      var tgl = await controller.selectDate(
                          context, controller.tglSelesaiDT.value);
                      if (tgl != null) {
                        controller.tglSelesai.text = controller.fmt.format(tgl);
                      }
                    },
                    autofocus: false,
                    readOnly: true,
                    controller: controller.tglSelesai,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: controller.warna)),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: controller.warna)),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: () async {
                      controller.dt = DateTime.now();
                      controller.jamSelesaiDT.value = controller.dt;
                      var jam = await controller.seletTime(
                          context, controller.jamSelesaiDT.value);
                      if (jam != null) {
                        controller.jamSelesai.text =
                            "${jam.hour.toString().padLeft(2, '0')}:${jam.minute.toString().padLeft(2, '0')}";
                      }
                    },
                    autofocus: false,
                    readOnly: true,
                    controller: controller.jamSelesai,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: controller.warna)),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: controller.warna)),
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
          (controller.nilaiKmSesudah > 0 && controller.nilaiKpSesudah > 0)
              ? metrikWidgetSesudah(controller.resiko.value)
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
              Text(
                "${controller.nilaiKmSesudah.value} * ${controller.nilaiKpSesudah.value} = ${controller.total.value}",
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

  Widget spacing(double i) {
    return SizedBox(
      height: i,
    );
  }

  Widget btnAksi(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 205, 205, 205),
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
                    controller.submit(context);
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
}
