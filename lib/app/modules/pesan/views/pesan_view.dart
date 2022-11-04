import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pesan_controller.dart';

class PesanView extends GetView<PesanController> {
  const PesanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Tanyakan Barang"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 8, bottom: 50),
                child: ListView(
                  children: [
                    inputBox(controller.noRkbCtrl, controller.noRkbFocus, 3,
                        "Nomor RKB", true, false),
                    inputBox(controller.partNameCtrl, controller.partNameFocus,
                        3, "Part Name", true, false),
                    inputBox(controller.subjectCtrl, controller.subjectFocus, 1,
                        "Judul", false, true),
                    inputBox(controller.pesanCtrl, controller.pesanFocus, 5,
                        "Pesan", true, true),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () async {
                      controller.kirim();
                    },
                    child: const Text(
                      "Kirim",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {},
                    child: const Text(
                      "Batal",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      
    );
  }

  Widget inputBox(TextEditingController remarksCtrl, FocusNode remarksFocus,
      int line, String label, bool validate, bool enable) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          enabled: enable,
          maxLines: line,
          focusNode: remarksFocus,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: label),
          onSaved: (value) {
            remarksCtrl.text = value!;
          },
          onFieldSubmitted: (term) {
            remarksFocus.unfocus();
          },
          validator: (validate)
              ? (value) {
                  if (value!.isEmpty) {
                    return '$label Wajib Di Isi';
                  }
                  return null;
                }
              : null,
          controller: remarksCtrl,
        ),
      ),
    );
  }
}
