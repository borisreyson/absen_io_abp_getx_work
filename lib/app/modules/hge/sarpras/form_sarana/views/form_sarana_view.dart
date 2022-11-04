import 'package:face_id_plus/app/data/models/data_karayawan.dart' as karyawan;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:face_id_plus/app/data/models/data_karayawan.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/form_sarana_controller.dart';

class FormSaranaView extends GetView<FormSaranaController> {
  const FormSaranaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Form Izin Sarana'),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              inputBox(
                controller.noLvCtrl,
                controller.noLvFocus,
                1,
                "Nomor Lambung",
                validate: true,
                enable: true,
                padding: 10,
                readonly: true,
                onTap: controller.tapNoLv,
              ),
              inputBox(
                controller.tglKeluarCtrl,
                controller.tglKeluarFocus,
                1,
                "Tanggal Keluar",
                validate: true,
                enable: true,
                padding: 10,
                readonly: true,
                onTap: () async {
                  DateTime? result =
                      await controller.selectDate(context, controller.dt);
                  if (result != null) {
                    controller.tglKeluarCtrl.text =
                        controller.fmt.format(result);
                  }
                },
              ),
              inputBox(
                controller.jamkeluarCtrl,
                controller.jamkeluarFocus,
                1,
                "Jam Keluar",
                validate: true,
                enable: true,
                padding: 10,
                readonly: true,
                onTap: () async {
                  DateTime? result =
                      await controller.seletTime(context, controller.dt);
                  if (result != null) {
                    controller.jamkeluarCtrl.text =
                        controller.jam.format(result);
                  }
                },
              ),
              Card(
                elevation: 0,
                margin: EdgeInsets.all(10),
                child: CheckboxListTile(
                  value: controller.isChecked.value,
                  onChanged: (v) {
                    print("Kembali $v");
                    controller.isChecked.value = v!;
                  },
                  title: Text("Waktu Kembali"),
                ),
              ),
              if (controller.isChecked.value)
                inputBox(
                  controller.tglKembaliCtrl,
                  controller.tglKembaliFocus,
                  1,
                  "Tanggal Kembali",
                  validate: true,
                  enable: true,
                  padding: 10,
                  readonly: true,
                  onTap: () async {
                    DateTime? result =
                        await controller.selectDate(context, controller.dt);
                    if (result != null) {
                      if (!controller.isChecked.value) {
                        controller.tglKembaliCtrl.text = "";
                        controller.jamKembaliCtrl.text = "";
                        controller.tglKembaliFocus.unfocus();
                        controller.jamKembaliFocus.unfocus();
                      }
                      controller.tglKembaliCtrl.text =
                          controller.fmt.format(result);
                    }
                  },
                ),
              if (controller.isChecked.value)
                inputBox(
                  controller.jamKembaliCtrl,
                  controller.jamKembaliFocus,
                  1,
                  "Jam Kembali",
                  validate: true,
                  enable: true,
                  padding: 10,
                  readonly: true,
                  onTap: () async {
                    DateTime? result =
                        await controller.seletTime(context, controller.dt);
                    if (result != null) {
                      controller.jamKembaliCtrl.text =
                          controller.jam.format(result);
                    }
                  },
                ),
              inputBox(controller.keteranganCtrl, controller.keteranganFocus, 5,
                  "Keperluan",
                  validate: true, enable: true, padding: 10, minLines: 2),
              inputBox(
                controller.penumpangCtrl,
                controller.penumpangFocus,
                5,
                "Penumpang",
                validate: true,
                enable: true,
                padding: 10,
                readonly: true,
                minLines: 1,
                onTap: () async {
                  controller.penumpangDipilih.clear();
                  List<Data> res = await Get.toNamed(Routes.PENUMPANG);
                  if (res != null) {
                    for (var e in res) {
                      controller.listNikPenumpang.add("${e.nik}");
                      controller.penumpangDipilih.add(
                          "(${e.nik}) ${e.nama} [${(e.sect != null) ? e.sect : "-"}] ");
                    }
                    controller.penumpangCtrl.text =
                        controller.penumpangDipilih.join(" ,\n ");
                  }
                },
              ),
              inputBox(
                controller.pemohonCtrl,
                controller.pemohonFocus,
                3,
                "Pemohon",
                validate: true,
                enable: true,
                padding: 10,
                readonly: true,
                minLines: 1,
              ),
              inputBox(
                  controller.driverCtrl, controller.driverFocus, 5, "Driver",
                  validate: true,
                  enable: true,
                  padding: 10,
                  readonly: true, onTap: () async {
                var result = await Get.toNamed(Routes.LIST_KARYAWAN);
                if (result != null) {
                  karyawan.Data driver = result;
                  controller.nikDriver.value = driver.nik;
                  controller.driverCtrl.text =
                      "(${driver.nik}) ${driver.nama} [${(driver.devisi != null) ? driver.devisi : "-"}]";
                } else {
                  controller.driverCtrl.text = "";
                }
              }, minLines: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.saveSarana();
                        },
                        child: Text("Kirim"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Batal"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputBox(
      TextEditingController ctrl, FocusNode focused, int line, String label,
      {bool validate = true,
      bool enable = true,
      double? padding,
      double? elevation,
      bool? readonly = false,
      Function()? onTap,
      int? minLines}) {
    return Card(
      elevation: (elevation != null) ? elevation : 0,
      child: Padding(
        padding: EdgeInsets.all((padding != null) ? padding : 0),
        child: TextFormField(
          onTap: onTap,
          readOnly: readonly!,
          enabled: enable,
          maxLines: line,
          minLines: minLines,
          focusNode: focused,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: label),
          onSaved: (value) {
            ctrl.text = value!;
          },
          onFieldSubmitted: (term) {
            focused.unfocus();
          },
          validator: (validate)
              ? (value) {
                  if (value!.isEmpty) {
                    return '$label Wajib Di Isi';
                  }
                  return null;
                }
              : null,
          controller: ctrl,
        ),
      ),
    );
  }
}
