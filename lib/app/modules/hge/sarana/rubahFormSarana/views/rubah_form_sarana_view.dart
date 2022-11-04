import 'package:face_id_plus/app/data/utils/utils.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rubah_form_sarana_controller.dart';

class RubahFormSaranaView extends GetView<RubahFormSaranaController> {
  const RubahFormSaranaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.loaded.value)
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 219, 132, 2),
              title: Text('${controller.deskripsi.value}'),
              centerTitle: true,
            ),
            body: (controller.fil.value == "pic_lv")
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: controller.formKey,
                      child: ListView(
                        children: [
                          Utils().inputBox(controller.deskCtrl.value,
                              controller.deskFocus, 1, "Pilih PIC",
                              readonly: true, onTap: () async {
                            var res = await Get.toNamed(Routes.LIST_KARYAWAN);
                            if (res != null) {
                              controller.deskCtrl.value.text = res.nama;
                              controller.deskRubahCtrl.value.text = res.nik;
                            }
                          }),
                          Visibility(
                            visible: false,
                            child: Utils().inputBox(
                                controller.deskRubahCtrl.value,
                                controller.deskRubahFocus,
                                3,
                                "Rubah",
                                minLines: 3),
                          ),
                          Center(
                            child: ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () {
                                controller.simpan();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: controller.formKey,
                      child: ListView(
                        children: [
                          Utils().inputBox(controller.deskCtrl.value,
                              controller.deskFocus, 1, "Deskripsi",
                              readonly: true),
                          Utils().inputBox(controller.deskRubahCtrl.value,
                              controller.deskRubahFocus, 3, "Rubah",
                              minLines: 3),
                          Center(
                            child: ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () {
                                controller.simpan();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          )
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ));
  }
}
