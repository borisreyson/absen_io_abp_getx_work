import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_maskapai_controller.dart';

class FormMaskapaiView extends GetView<FormMaskapaiController> {
  const FormMaskapaiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Form Data Maskapai'),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              if (controller.option.value)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("${controller.data.value.namaMaskapai}"),
                ),
              inputBox(
                label: "Nama Maskapai",
                ctrl: controller.namaMaskapaiCtrl,
                focused: controller.namaMaskapaiFocus,
                padding: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () {
                      if (controller.option.value) {
                        controller.updateMaskapai();
                      } else {
                        controller.simpanMaskapai();
                      }
                    },
                    child: const Text("Simpan")),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputBox(
      {TextEditingController? ctrl,
      FocusNode? focused,
      int? line = 1,
      String? label,
      bool validate = true,
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
        ),
      ),
    );
  }
}
