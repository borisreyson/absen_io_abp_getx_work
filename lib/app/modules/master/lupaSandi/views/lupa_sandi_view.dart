import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/lupa_sandi_detail.dart';
import '../controllers/lupa_sandi_controller.dart';

class LupaSandiView extends GetView<LupaSandiController> {
  const LupaSandiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Get.back();
                  }),
              title: const Text('Lupa Sandi'),
              centerTitle: true),
          backgroundColor: const Color.fromARGB(255, 176, 172, 172),
          body: ListView(children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  optionWidget(),
                  formWidget(),
                ],
              ),
            ),
            if (controller.found.value || controller.foundUsername.value)
              listDataView(),
            if (controller.found.value || controller.foundUsername.value)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      if (controller.nikResult != null) {
                        controller.sendOTP();
                      }
                    },
                    child: const Text("Kirim Kode Verifikasi")),
              ),
          ]),
        ));
  }

  Widget optionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: Get.width / 2,
          child: RadioListTile(
            value: 1,
            groupValue: controller.pilih.value,
            onChanged: (int? v) {
              controller.found.value = false;
              controller.foundUsername.value = false;
              controller.pilih.value = v;
              controller.nikCtrl.clear();
              controller.usernameCtrl.clear();
            },
            title: const Text("Dengan Nik"),
          ),
        ),
        SizedBox(
          width: Get.width / 2,
          child: RadioListTile(
            value: 2,
            groupValue: controller.pilih.value,
            onChanged: (int? v) {
              controller.found.value = false;
              controller.foundUsername.value = false;
              controller.nikCtrl.clear();
              controller.usernameCtrl.clear();
              controller.pilih.value = v;
            },
            title: const Text("Dengan Username"),
          ),
        ),
      ],
    );
  }

  Widget formWidget() {
    return Column(
      children: [
        if (controller.pilih.value == 1)
          Form(
            key: controller.nikKey,
            child: inputBox(
              ctrl: controller.nikCtrl,
              focused: controller.nikFocus,
              padding: 10,
              keyboardType: TextInputType.number,
              label: "Masukkan Nik Untuk Mencari Akun",
              sufixIcon: InkWell(
                onTap: () async {
                  if (controller.nikKey.currentState!.validate()) {
                    await controller.cekNik(controller.nikCtrl.text);
                  }
                },
                child: const Icon(Icons.search),
              ),
            ),
          ),
        if (controller.pilih.value == 2)
          Form(
            key: controller.usernameKey,
            child: inputBox(
              ctrl: controller.usernameCtrl,
              focused: controller.usernameFcocus,
              padding: 10,
              label: "Masukkan Username Untuk Mencari Akun",
              sufixIcon: InkWell(
                onTap: () async {
                  if (controller.usernameKey.currentState!.validate()) {
                    await controller.cekUsername(controller.usernameCtrl.text);
                  }
                },
                child: const Icon(Icons.search),
              ),
            ),
          ),
      ],
    );
  }

  Widget listDataView() {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: dataResult(controller.nikResult.value)),
    );
  }

  Widget dataResult(DataLogin e) {
    return Column(
      children: [
        fotoView(e),
        Container(
          width: Get.width,
          height: 1,
          color: Colors.black,
        ),
        Table(
          children: [
            TableRow(children: [
              const Text("Nik"),
              Text("${e.nik}", textAlign: TextAlign.right),
            ]),
            TableRow(children: [
              const Text("Nama Lengkap"),
              Text("${e.namaLengkap}", textAlign: TextAlign.right),
            ]),
            TableRow(children: [
              const Text("Email"),
              Text("${e.email}", textAlign: TextAlign.right),
            ]),
            TableRow(children: [
              const Text("Devisi"),
              Text("${e.sect}", textAlign: TextAlign.right),
            ]),
            TableRow(children: [
              const Text("Departemen"),
              Text("${e.dept}", textAlign: TextAlign.right),
            ]),
            TableRow(children: [
              const Text("Perusahaan"),
              Text(
                "${e.namaPerusahaan}",
                textAlign: TextAlign.right,
              ),
            ])
          ],
        ),
      ],
    );
  }

  SizedBox fotoView(DataLogin e) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Card(
        color: const Color.fromARGB(146, 147, 147, 148),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: "${e.photoProfile}",
                fit: BoxFit.cover,
                placeholder: (contex, url) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
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
