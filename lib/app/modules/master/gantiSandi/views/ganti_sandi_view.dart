import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';

import '../controllers/ganti_sandi_controller.dart';

class GantiSandiView extends GetView<GantiSandiController> {
  const GantiSandiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Ganti Sandi',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Center(
                  child: Text(
                "Kode Verifikasi Sudah Di Kirim Ke ${controller.data.value.email} ",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
              const SizedBox(
                height: 10,
              ),
              const Center(
                  child: Text(
                "Masukkan Kode Verifikasi ",
                style: TextStyle(fontSize: 16),
              )),
              const SizedBox(
                height: 10,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color.fromARGB(255, 38, 6, 115),
                showFieldAsBox: false,
                keyboardType: TextInputType.number,
                clearText: true,
                onSubmit: (String verificationCode) async {
                  controller.kodeOtp.value = verificationCode;
                  
                  controller.verifikasiOtp(verificationCode);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Kirim Ulang?",
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: (controller.start.value == 0)
                              ? () {
                                  controller.verifikasiOtp(
                                      "${controller.kodeOtp.value}");
                                }
                              : null,
                          child: const Text(
                            "Kirim",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${controller.start.value}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Verifikasi")),
            ],
          ),
        ),
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
          maxLines: line,
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
