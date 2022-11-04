import 'package:face_id_plus/app/modules/hge/cuti/models/form_cuti_model.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/roster_cuti_karyawan.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../data/utils/constants.dart';
import '../../models/tiket_mode.dart';

class TanggalCutiController extends GetxController {
  final provider = ProviderCuti();
  final lapanganCtrl = TextEditingController().obs;
  final tglMembawaKeluargaCtrl = TextEditingController().obs;
  final tglCutiCtrl = TextEditingController().obs;
  final jenisCutiCtrl = TextEditingController().obs;
  final bukanLapanganCtrl = TextEditingController().obs;
  final berangkatDariCtrl = TextEditingController().obs;
  final kembaliKeCtrl = TextEditingController().obs;

  final lapanganFocus = FocusNode().obs;
  final tglMembawaKeluargaFocus = FocusNode().obs;
  final tglCutiFocus = FocusNode().obs;
  final jenisCutiFocus = FocusNode().obs;
  final bukanLapanganFocus = FocusNode().obs;
  final berangkatDariFocus = FocusNode().obs;
  final kembaliKeFocus = FocusNode().obs;

  final formKey = GlobalKey<FormState>();
  final keluarga = RxInt(2);
  final tiketPesawat = RxInt(2);
  final fmt = DateFormat('dd MMMM yyyy');
  final dt = DateTime.now();
  final idCuti = RxnString(null);
  final dari = DateTime.now().obs, sampai = DateTime.now().obs;

  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, minTime: dt, currentTime: initDate);
  }

  final lapangan = false.obs;
  final jenisCuti = false.obs;
  final dataRoster = Data().obs;
  final formCuti = FormCutiModel().obs;
  final mulai = RxnString(null);
  final selesai = RxnString(null);
  final resultTest = RxnString(null);
  @override
  void onInit() async {
    var ar = await Get.arguments;
    if (ar != null) {
      var res = await ar['data'];
      if (res != null) {
        formCuti.value = res;
      }
    }
    super.onInit();
  }

  tapTglCuti() async {
    var res =
        await Get.toNamed(Routes.ROSTER_CUTI, arguments: {"argumen": true});
    if (res != null) {
      dataRoster.value = res;
      idCuti.value = "${dataRoster.value.idCuti}";
      mulai.value =
          fmt.format(DateTime.parse("${dataRoster.value.tglMulaiCuti}"));
      selesai.value =
          fmt.format(DateTime.parse("${dataRoster.value.tglSelesaiCuti}"));
      tglCutiCtrl.value.text = "$mulai - $selesai";
    }
  }

  tapJenisCuti() async {
    var res = await Get.toNamed(Routes.JENIS_CUTI);
    if (res != null) {
      if (res == "Cuti Lapangan") {
        lapangan.value = true;
        jenisCuti.value = false;
      } else {
        lapangan.value = false;
        jenisCuti.value = true;
      }
      jenisCutiCtrl.value.text = res;
    } else {
      jenisCuti.value = false;
    }
  }

  Widget tglPick(String title, initial) {
    var inital = initial;
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return StatefulBuilder(
      builder: (context, stateSet) {
        return Card(
          color: Colors.orange,
          elevation: 10,
          child: InkWell(
              onTap: () async {
                var selected = await selectDate(context, inital!);
                if (selected != null) {
                  if (title == "Dari") {
                    stateSet(() {
                      dari.value = selected;
                      inital = selected;
                    });
                  } else if (title == "Sampai") {
                    stateSet(() {
                      sampai.value = selected;
                      inital = selected;
                    });
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: style,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(fmt.format(inital!), style: style),
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget submitWidgetDTrange() {
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return Card(
      color: Colors.orange,
      elevation: 10,
      child: InkWell(
          onTap: () async {
            mulai.value = fmt.format(dari.value);
            selesai.value = fmt.format(sampai.value);
            var durasiCuti =
                "${fmt.format(dari.value)} - ${fmt.format(sampai.value)}";

            bukanLapanganCtrl.value.text = durasiCuti;

            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Submit",
                  style: style,
                ),
              ],
            ),
          )),
    );
  }

  void simpanCuti() async {
    if (formKey.currentState!.validate()) {
      Constants().showAlert(
        dismiss: true,
        loading: true,
        enBtn: false,
      );
      var body = bodyData();

      var cutiPost = CutiPost();
      cutiPost.formCuti = formCuti.value;
      cutiPost.tglCuti = body;
      cutiPost.tiketCuti = null;
      await provider.cutiPostApi(cutiPost).then((value) {
        var res = value.success;
        if (res!) {
          Get.back();
          Get.back(result: true);
        } else {
          Get.back();
          Get.snackbar("Gagal", "Gagal Membuat Cuti Online, Coba Lagi!",
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      });
    }
  }

  void tiketPesawatForm() async {
    if (formKey.currentState!.validate()) {
      var body = bodyData();
      var res = await Get.toNamed(Routes.TIKET_PESAWAT_CUTI,
          arguments: {"formCuti": formCuti.value, "tglCuti": body});
      if (res != null) {
        Get.back(result: true);
      }
    }
  }

  TanggalCuti bodyData() {
    var body = TanggalCuti();
    body.keluarga = "${keluarga.value}";
    body.tglKeluarga = tglMembawaKeluargaCtrl.value.text;
    body.jenisCuti = jenisCutiCtrl.value.text;
    body.idCuti = idCuti.value;
    body.tglCutiDari = mulai.value;
    body.tglCutiSampai = selesai.value;
    body.tiketPesawat = "${tiketPesawat.value}";
    body.berangkatDari = berangkatDariCtrl.value.text;
    body.kembaliKe = kembaliKeCtrl.value.text;
    return body;
  }
}
