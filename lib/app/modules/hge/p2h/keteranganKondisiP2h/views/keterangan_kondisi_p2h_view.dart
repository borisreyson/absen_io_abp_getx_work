import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/keterangan_kondisi_p2h_controller.dart';

class KeteranganKondisiP2hView extends GetView<KeteranganKondisiP2hController> {
  const KeteranganKondisiP2hView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 235, 233, 233),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 233, 233),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.data.value.diperiksa}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const Text("Tidak Baik"),
                        ],
                      ),
                    ),
                  ),
                  inputBox(
                      minLines: 4,
                      padding: 10,
                      margins: 5,
                      elevation: 10,
                      label: "Keterangan Kondisi",
                      ctrl: controller.keteranganKondisiCtrl.value),
                  Card(
                    elevation: 10,
                    margin: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        controller.buktiPicker();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            (controller.fileName.value != null)
                                ? Image.file(File("${controller.fileName.value}"))
                                : Icon(
                                    Icons.add_photo_alternate_rounded,
                                    size: Get.width / 2,
                                  ),
                            const Text(
                              "Foto Atau Gamabar Tidak Wajib",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.saveKondisi();
                        },
                        child: const Text("Submit")),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget inputBox(
      {TextEditingController? ctrl,
      FocusNode? focused,
      TextInputType? inputType,
      int? line,
      String? label,
      bool validate = true,
      bool enable = true,
      double? padding,
      double? elevation,
      bool? readonly = false,
      Function()? onTap,
      int? minLines,
      double? margins = 0}) {
    return Card(
      margin: EdgeInsets.all(margins!),
      elevation: (elevation != null) ? elevation : 0,
      child: Padding(
        padding: EdgeInsets.all((padding != null) ? padding : 0),
        child: TextFormField(
          onTap: onTap,
          keyboardType: inputType,
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
    );
  }
}
