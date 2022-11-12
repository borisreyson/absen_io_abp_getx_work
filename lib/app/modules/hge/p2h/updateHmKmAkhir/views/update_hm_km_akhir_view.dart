import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/utils/utils.dart';
import '../controllers/update_hm_km_akhir_controller.dart';

class UpdateHmKmAkhirView extends GetView<UpdateHmKmAkhirController> {
  const UpdateHmKmAkhirView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.loaded.value)
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  )),
              backgroundColor: const Color.fromARGB(255, 231, 229, 229),
              title: Text(
                'Update HM / KM Akhir ${controller.data.value.p2hNoLambung}',
                style: const TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            backgroundColor: const Color.fromARGB(255, 231, 229, 229),
            body: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  inputBox(
                    ctrl: controller.noLvCtrl,
                    focused: controller.noLvFocus,
                    label: "Nomor Lambung",
                    padding: 10,
                    elevation: 10,
                    readonly: true,
                  ),
                  inputBox(
                    ctrl: controller.noPolCtrl,
                    focused: controller.noPolFocus,
                    label: "Nomor Polisi",
                    padding: 10,
                    elevation: 10,
                    readonly: true,
                  ),
                  hmKmAwal(),
                  hmKmAkhir(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width / 2.2,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.simpan();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 3, 53, 5)),
                            child: const Text("Simpan"),
                          ),
                        ),
                        SizedBox(
                          width: Get.width / 2.2,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 103, 6, 6)),
                            child: const Text("Batal"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          ));
  }

  Widget hmKmAwal() {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 10,
      child: Column(
        children: [
          const Center(
            child: Text(
              "HM / KM Awal",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 1,
            width: Get.width,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.fmt.format(DateTime.parse("${controller.data.value.p2hTglAwal}"))} ${controller.data.value.p2hJamAwal}",
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  (controller.data.value.p2hHmKmAwal != null)
                      ? CurrencyFormat().convertToIdr(
                              int.parse("${controller.data.value.p2hHmKmAwal}"),
                              0) +
                          " KM"
                      : "-",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 10, 71, 12)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget hmKmAkhir() {
    return Column(
      children: [
        const Card(
          margin: EdgeInsets.all(5),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "HM / KM Akhir",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        inputBox(
          ctrl: controller.hmKmAkhirCtrl,
          focused: controller.hmKmAkhirFocus,
          label: "HM / KM AKHIR",
          padding: 10,
          elevation: 10,
          inputType: TextInputType.number,
        ),
      ],
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
}
