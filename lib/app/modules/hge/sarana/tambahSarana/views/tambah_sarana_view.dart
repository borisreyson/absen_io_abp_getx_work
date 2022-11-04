import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../controllers/tambah_sarana_controller.dart';

class TambahSaranaView extends GetView<TambahSaranaController> {
  const TambahSaranaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 219, 132, 2),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
          title: const Text(
            'Tambah Unit Sarana',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 194, 191, 191),
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                inputBox(controller.noPolCtrl.value, controller.noPolFocus, 1,
                    "Nomor Polisi",
                    padding: 10),
                inputBox(controller.noLvCtrl, controller.noLvFocus, 1,
                    "Nomor Lambung",
                    padding: 10),
                inputBox(controller.picCtrl, controller.picFocus, 1, "PIC",
                    padding: 10, readonly: true, onTap: () async {
                  var res = await Get.toNamed(Routes.LIST_KARYAWAN);
                  if (res != null) {
                    controller.picCtrl.text = res.nama;
                    controller.nikPic.value = res.nik;
                  }
                }),
                inputBox(controller.merekTipeCtrl, controller.merekTipeFocus, 1,
                    "Merek Tipe",
                    padding: 10),
                inputBox(
                    controller.jenisCtrl, controller.jenisFocus, 1, "Jenis",
                    padding: 10),
                inputBox(controller.modelCtrl, controller.modeFocus, 1, "Model",
                    padding: 10),
                inputBox(controller.thnPembuatanCtrl,
                    controller.thnPembuatanFocus, 1, "Tahun Pembuatan",
                    padding: 10),
                inputBox(controller.isiSlinderCtrl, controller.isiSlinderFocus,
                    1, "Isi Silinder",
                    padding: 10),
                inputBox(controller.warnaKBCtrl, controller.warnaKBFocus, 1,
                    "Warna KB",
                    padding: 10),
                inputBox(controller.warnaTNKBCtrl, controller.warnaTNKBFocus, 1,
                    "Warna TNKB",
                    padding: 10),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.simpan();
                      },
                      child: const Text("Simpan"),
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Batal"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
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
          textCapitalization: TextCapitalization.characters,
        ),
      ),
    );
  }
}
