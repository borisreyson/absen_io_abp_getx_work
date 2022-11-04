import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sarpras_admin_controller.dart';

class SarprasAdminView extends GetView<SarprasAdminController> {
  const SarprasAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Batalkan Surat Izin'),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              inputBox(
                  ctrl: controller.keteranganCtrl,
                  focused: controller.keteranganFocus,
                  line: 4,
                  label: "Keterangan Batal",
                  elevation: 10,
                  padding: 10,
                  margin: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.cancelSarana();
                        },
                        child: Text("Simpan")),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Batal",
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
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
    return Card(
      margin: EdgeInsets.all((margin != null) ? margin : 0),
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
