import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/from_p2_h_controller.dart';

class FromP2HView extends GetView<FromP2HController> {
  const FromP2HView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.loaded.value)
          ? Scaffold(
              floatingActionButton: floatingAction(),
              backgroundColor: const Color.fromARGB(255, 217, 215, 215),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 207, 205, 205),
                leading: IconButton(
                    onPressed: () async {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    )),
                title: const Text(
                  'Form P2H ',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    inputBox(
                        ctrl: controller.noPolCtrl.value,
                        label: "Nomor Polisi",
                        focused: controller.noPolFocus,
                        padding: 10,
                        readonly: (controller.saranaId.value != null),
                        elevation: 10),
                    inputBox(
                        ctrl: controller.noLvCtrl.value,
                        label: "Nomor Lambung",
                        focused: controller.noLvFocus,
                        padding: 10,
                        readonly: (controller.saranaId.value != null),
                        elevation: 10),
                    inputBox(
                        ctrl: controller.shiftCtrl.value,
                        label: "Shift",
                        focused: controller.shiftFocus,
                        padding: 10,
                        inputType: TextInputType.number,
                        elevation: 10),
                    inputBox(
                        ctrl: controller.hmKmAwalCtrl.value,
                        label: "HM / KM Awal",
                        focused: controller.hmKmAwalFocus,
                        padding: 10,
                        inputType: TextInputType.number,
                        elevation: 10),
                  ],
                ),
              ),
            )
          : const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              )),
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
      int? minLines}) {
    return Card(
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

  Widget floatingAction() {
    return FloatingActionButton.extended(
      onPressed: () async {
        await controller.simpanLokal();
      },
      label: Row(
        children: const [
          Text("Lanjut"),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
