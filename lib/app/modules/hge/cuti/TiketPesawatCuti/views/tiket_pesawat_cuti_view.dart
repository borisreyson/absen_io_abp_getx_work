import 'package:face_id_plus/app/modules/hge/cuti/models/maskapai_model.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tiket_pesawat_cuti_controller.dart';

class TiketPesawatCutiView extends GetView<TiketPesawatCutiController> {
  const TiketPesawatCutiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('Tiket Pesawat'),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 60),
                child: ListView(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 147, 84, 7),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Tiket Berangkat",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    berangkat(context),
                    Container(
                      color: const Color.fromARGB(255, 4, 77, 7),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Tiket Kembali",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    pulang(context),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        controller.simpanCuti();
                      },
                      child: const Text("Simpan")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profile() {
    return Column(
      children: [
        inputBox(
          label: "Nama Penumpang Sesuai KTP",
          ctrl: controller.namaCtrl,
          focused: controller.namaFocus,
          padding: 10,
        ),
        inputBox(
          label: "Tanggal Lahir",
          ctrl: controller.tglLahirCtrl,
          focused: controller.tglLahirFocus,
          padding: 10,
        ),
        inputBox(
          label: "Nomor HP",
          ctrl: controller.hpCtrl,
          focused: controller.hpFocus,
          padding: 10,
        ),
      ],
    );
  }

  Widget berangkat(context) {
    return Column(
      children: [
        inputBox(
          label: "Berangkat Dari",
          ctrl: controller.berangkatDariCtrl,
          focused: controller.berangkatDariFocus,
          padding: 10,
        ),
        inputBox(
          label: "Tujuan Ke",
          ctrl: controller.berangkatTujuanCtrl,
          focused: controller.berangkatTujuanFocus,
          padding: 10,
        ),
        inputBox(
          label: "Tanggal Terbang",
          ctrl: controller.berangkatTglCtrl,
          focused: controller.berangkatTglFocus,
          padding: 10,
          readonly: true,
          onTap: () async {
            var res = await controller.selectDate(context, controller.dt);
            if (res != null) {
              controller.berangkatTglCtrl.text = controller.fmt.format(res);
            }
          },
        ),
        inputBox(
          label: "Jam Terbang",
          ctrl: controller.berangkatJamCtrl,
          focused: controller.beranglatJamFocus,
          padding: 10,
          readonly: true,
          onTap: () async {
            var jamRes = await controller.seletTime(context, controller.dt);
            if (jamRes != null) {
              controller.berangkatJamCtrl.text =
                  "${jamRes.hour.toString().padLeft(2, '0')} : ${jamRes.minute.toString().padLeft(2, '0')}";
            }
          },
        ),
        inputBox(
          label: "Maskapai",
          ctrl: controller.maskapaiCtrl,
          focused: controller.maskapaiFocus,
          padding: 10,
          readonly: true,
          onTap: () async {
            var maskapai = await Get.toNamed(Routes.MASKAPAI_LIST,
                arguments: {"pilihan": true});
            if (maskapai != null) {
              Data maskapaiData = maskapai;
              controller.maskapaiCtrl.text = "${maskapaiData.namaMaskapai}";
            }
          },
        ),
      ],
    );
  }

  Widget pulang(context) {
    return Column(
      children: [
        inputBox(
          label: "Berangkat Dari",
          ctrl: controller.kembaliDariCtrl,
          focused: controller.kembaliDariFocus,
          padding: 10,
        ),
        inputBox(
          label: "Tujuan Ke",
          ctrl: controller.kembaliTujuanCtrl,
          focused: controller.kembaliTujuanFocus,
          padding: 10,
        ),
        inputBox(
          label: "Tanggal Terbang",
          ctrl: controller.kembaliTglCtrl,
          focused: controller.kembaliTglFocus,
          padding: 10,
          readonly: true,
          onTap: () async {
            var res = await controller.selectDate(context, controller.dt);
            if (res != null) {
              controller.kembaliTglCtrl.text = controller.fmt.format(res);
            }
          },
        ),
        inputBox(
          label: "Jam Terbang",
          ctrl: controller.kembaliJamCtrl,
          focused: controller.kembaliJamFocus,
          padding: 10,
          readonly: true,
          onTap: () async {
            var jamRes = await controller.seletTime(context, controller.dt);
            if (jamRes != null) {
              controller.kembaliJamCtrl.text =
                  "${jamRes.hour.toString().padLeft(2, '0')} : ${jamRes.minute.toString().padLeft(2, '0')}";
            }
          },
        ),
        inputBox(
          label: "Maskapai",
          ctrl: controller.kembaliMaskapaiCtrl,
          focused: controller.kembaliMaskapaiFocus,
          padding: 10,
          readonly: true,
          onTap: () async {
            var maskapai = await Get.toNamed(Routes.MASKAPAI_LIST,
                arguments: {"pilihan": true});
            if (maskapai != null) {
              Data maskapaiData = maskapai;
              controller.kembaliMaskapaiCtrl.text =
                  "${maskapaiData.namaMaskapai}";
            }
          },
        ),
      ],
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
