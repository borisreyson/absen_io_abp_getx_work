import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ganti_sandi_form_controller.dart';

class GantiSandiFormView extends GetView<GantiSandiFormController> {
  const GantiSandiFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ganti Sandi'),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                inputBox(
                    obscureText: true,
                    ctrl: controller.sandiBaruCtrl,
                    focused: controller.sandiBaruFocus,
                    label: "Sandi Baru",
                    minLines: 1),
                inputBox(
                    obscureText: true,
                    ctrl: controller.ulangiSandiBaruCtrl,
                    focused: controller.ulangiSandiBaruFocus,
                    label: "Ulangi Sandi Baru",
                    minLines: 1),
                ElevatedButton(
                    onPressed: () {
                      controller.simpanSandi();
                    },
                    child: const Text("Simpan"))
              ],
            ),
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
      Function(String?)? onComplete,
      int? minLines,
      Color? cardColor,
      Icon? prefixIcon,
      // ignore: unnecessary_question_mark
      dynamic? sufixIcon,
      // ignore: unnecessary_question_mark
      dynamic? keyboardType,
      bool? obscureText = false}) {
    return Card(
      color: cardColor,
      elevation: (elevation != null) ? elevation : 0,
      child: Padding(
        padding: EdgeInsets.all((padding != null) ? padding : 0),
        child: TextFormField(
          keyboardType: keyboardType,
          onTap: onTap,
          readOnly: readonly!,
          enabled: enable,
          minLines: minLines,
          focusNode: focused,
          obscureText: obscureText!,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: sufixIcon,
              border: const OutlineInputBorder(),
              labelText: label),
          onSaved: (value) {
            ctrl?.text = value!;
          },
          onFieldSubmitted: (term) {
            focused?.unfocus();
          },
          onChanged: onComplete,
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
