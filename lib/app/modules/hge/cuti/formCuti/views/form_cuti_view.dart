import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_cuti_controller.dart';

class FormCutiView extends GetView<FormCutiController> {
  const FormCutiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('Form Pengajuan Cuti'),
          centerTitle: true,
        ),
        floatingActionButton:
            (controller.nikAtasan.value != null) ? floatingAction() : null,
        body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: inputBox(
                  controller.namaAtasanCtrl.value,
                  controller.namaAtasanFocus.value,
                  1,
                  "Nama Atasan",
                  readonly: true,
                  onTap: () async {
                    var result = await Get.toNamed(Routes.LIST_KARYAWAN);
                    if (result != null) {
                      controller.dataKaryawan.value = result;
                      controller.namaAtasanCtrl.value.text =
                          "${controller.dataKaryawan.value.nama}";
                      controller.nikAtasan.value =
                          "${controller.dataKaryawan.value.nik}";
                    }
                  },
                  elevation: 10,
                  padding: 10,
                  sufixIcon: (controller.nikAtasan.value != null)
                      ? InkWell(
                          onTap: () {
                            controller.nikAtasan.value = null;
                            controller.namaAtasanCtrl.value.text = "";
                          },
                          borderRadius: BorderRadius.circular(1),
                          child: const Icon(
                            Icons.clear_rounded,
                          ),
                        )
                      : null,
                ),
              ),
              if (controller.nikAtasan.value != null) dataKaryawan(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget dataKaryawan(context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            inputBox(
              controller.namaCtrl.value,
              controller.namaFocus.value,
              1,
              "Nama",
            ),
            inputBox(controller.statusKeluargaCtrl.value,
                controller.statusKeluargaFocus.value, 1, "Status Keluarga",
                readonly: true, onTap: controller.tapStatusKeluarga),
            inputBox(
              controller.nikCtrl.value,
              controller.nikFocus.value,
              1,
              "NRP / NIK",
            ),
            inputBox(
                controller.tglBekerjaCtrl.value,
                controller.tglBekerjaFocus.value,
                1,
                "Tanggal Mulai Bekerja", onTap: () async {
              DateTime? result =
                  await controller.selectDate(context, controller.dt);
              if (result != null) {
                controller.tglBekerjaCtrl.value.text =
                    controller.fmt.format(result);
              }
            }, readonly: true),
            inputBox(controller.statusKaryawanCtrl.value,
                controller.statusKaryawanFocus.value, 1, "Status Karyawan",
                readonly: true, onTap: controller.tapStatusKaryawan),
            inputBox(
              controller.alamatCtrl.value,
              controller.alamatFocus.value,
              4,
              "Alamat",
              minLines: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget inputBox(
    TextEditingController ctrl,
    FocusNode focused,
    int line,
    String label, {
    bool validate = true,
    bool enable = true,
    double? padding,
    double? elevation,
    bool? readonly = false,
    Function()? onTap,
    int? minLines,
    Icon? prefixIcon,
    dynamic sufixIcon,
  }) {
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
              prefixIcon: prefixIcon,
              suffix: sufixIcon,
              border: const OutlineInputBorder(),
              labelText: label),
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

  Widget floatingAction() {
    return FloatingActionButton(
      onPressed: () async {
        controller.nextForm();
      },
      child: const Icon(Icons.queue_play_next),
    );
  }
}
