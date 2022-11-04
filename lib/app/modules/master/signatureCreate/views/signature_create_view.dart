import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import '../controllers/signature_create_controller.dart';

class SignatureCreateView extends GetView<SignatureCreateController> {
  const SignatureCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onPressBack,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Buat Tanda Tangan'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                var res = await Get.defaultDialog(
                    title: "Canvas Setting",
                    content: dialogContent(context),
                    confirm: ElevatedButton(
                        onPressed: () {
                          Get.back(result: true);
                        },
                        child: const Text("OK")));
                if (res != null) {
                  controller.maxPencil.value = controller.sizeUpdate.value;
                  controller.colorCanvas.value =
                      controller.colorCanvasUpdate.value;
                  controller.colorPencil.value =
                      controller.colorPencilUpdate.value;
                  controller.signatureController.value = SignatureController(
                      penColor: controller.colorPencil.value,
                      penStrokeWidth: controller.maxPencil.value);
                }
              },
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Obx(
              () => Signature(
                controller: controller.signatureController.value,
                backgroundColor: controller.colorCanvas.value,
              ),
            ),
            floatingAction(context),
          ],
        ),
      ),
    );
  }

  Widget dialogContent(context) {
    return Obx(
      () => Column(
        children: [
          Column(
            children: [
              const Text("Tebal Garis"),
              Slider(
                  max: 20,
                  min: 1.0,
                  value: controller.sizeUpdate.value,
                  onChanged: (v) {
                    controller.sizeUpdate.value = v;
                  }),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: Get.width,
                height: controller.sizeUpdate.value,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Warna Tulisan"),
                        InkWell(
                          onTap: () async {
                            controller.colorPencilUpdate.value =
                                await showColorPickerDialog(
                              context,
                              controller.colorPencilUpdate.value,
                              pickersEnabled: <ColorPickerType, bool>{
                                ColorPickerType.wheel: true,
                              },
                              copyPasteBehavior:
                                  const ColorPickerCopyPasteBehavior(
                                copyButton: true,
                                pasteButton: true,
                                longPressMenu: true,
                              ),
                              actionButtons: const ColorPickerActionButtons(
                                okButton: true,
                                closeButton: true,
                                dialogActionButtons: false,
                              ),
                              constraints: const BoxConstraints(
                                  minHeight: 480, minWidth: 320, maxWidth: 320),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: controller.colorPencilUpdate.value,
                            ),
                            margin: const EdgeInsets.only(top: 10),
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Warna Canvas"),
                        InkWell(
                          onTap: () async {
                            controller.colorCanvasUpdate.value =
                                await showColorPickerDialog(
                              context,
                              controller.colorCanvasUpdate.value,
                              pickersEnabled: <ColorPickerType, bool>{
                                ColorPickerType.wheel: true,
                              },
                              copyPasteBehavior:
                                  const ColorPickerCopyPasteBehavior(
                                copyButton: true,
                                pasteButton: true,
                                longPressMenu: true,
                              ),
                              actionButtons: const ColorPickerActionButtons(
                                okButton: true,
                                closeButton: true,
                                dialogActionButtons: false,
                              ),
                              constraints: const BoxConstraints(
                                  minHeight: 480, minWidth: 320, maxWidth: 320),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              color: controller.colorCanvasUpdate.value,
                            ),
                            margin: const EdgeInsets.only(top: 10),
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget floatingAction(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FloatingActionButton.extended(
              heroTag: "bersihkan",
              backgroundColor: Colors.red,
              onPressed: () {
                controller.signatureController.value.clear();
                print("OK");
              },
              label: const Text("Bersihkan"),
              icon: const Icon(Icons.refresh_rounded),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FloatingActionButton.extended(
              heroTag: "simpan",
              backgroundColor: const Color.fromARGB(255, 37, 118, 40),
              onPressed: () async {
                controller.simpanGambar();
              },
              label: const Text("Simpan"),
              icon: const Icon(CupertinoIcons.signature),
            ),
          ),
        ],
      ),
    );
  }
}
