import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_master_pemeriksaan_p2_h_controller.dart';

class TambahMasterPemeriksaanP2HView
    extends GetView<TambahMasterPemeriksaanP2HController> {
  const TambahMasterPemeriksaanP2HView({Key? key}) : super(key: key);
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
            'Tambah',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 216, 216, 216),
        body: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                inputBox(
                  margin: 10,
                  padding: 10,
                  elevation: 10,
                  minLines: 5,
                  label: "Isian Pemeriksaan Sarana",
                  ctrl: controller.diperiksaCtrl.value,
                  focused: controller.diperiksaFocus,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: (controller.username.value != null)
                        ? () {
                            controller.postData();
                          }
                        : null,
                    child: const Text("Simpan"),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget inputBox(
      {TextEditingController? ctrl,
      FocusNode? focused,
      int? line,
      String? label,
      bool validate = true,
      bool enable = true,
      double? padding,
      double? elevation,
      bool? readonly = false,
      Function()? onTap,
      int? minLines,
      double? margin}) {
    return Container(
      margin: EdgeInsets.all(margin ?? 0),
      child: Card(
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
              ctrl?.text = value!;
            },
            onFieldSubmitted: (term) {
              focused?.unfocus();
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
      ),
    );
  }
}
