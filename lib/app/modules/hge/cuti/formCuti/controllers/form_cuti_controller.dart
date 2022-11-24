import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/form_cuti_model.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:face_id_plus/app/sqlite_db/models/data_karyawan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class FormCutiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> namaCtrl = TextEditingController().obs;
  Rx<TextEditingController> statusKeluargaCtrl = TextEditingController().obs;
  Rx<TextEditingController> nikCtrl = TextEditingController().obs;
  Rx<TextEditingController> tglBekerjaCtrl = TextEditingController().obs;
  Rx<TextEditingController> alamatCtrl = TextEditingController().obs;
  Rx<TextEditingController> statusKaryawanCtrl = TextEditingController().obs;
  Rx<TextEditingController> namaAtasanCtrl = TextEditingController().obs;

  Rx<FocusNode> namaFocus = FocusNode().obs;
  Rx<FocusNode> statusKeluargaFocus = FocusNode().obs;
  Rx<FocusNode> nikFocus = FocusNode().obs;
  Rx<FocusNode> tglBekerjaFocus = FocusNode().obs;
  Rx<FocusNode> alamatFocus = FocusNode().obs;
  Rx<FocusNode> statusKaryawanFocus = FocusNode().obs;
  Rx<FocusNode> namaAtasanFocus = FocusNode().obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final dt = DateTime.now();
  var uid = const Uuid();
  final nama = RxnString(null);
  final nik = RxnString(null);
  final nikAtasan = RxnString(null);
  final dataKaryawan = DataKaryawan().obs;
  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    nama.value = pref.getString(Constants.name);
    nik.value = pref.getString(Constants.nik);
    namaCtrl.value.text = "${nama.value}";
    nikCtrl.value.text = "${nik.value}";
    tglBekerjaCtrl.value.text = fmt.format(dt);
    super.onInit();
  }

  tapStatusKeluarga() async {
    var res = await Get.toNamed(Routes.STATUS_KELUARGA);
    if (res != null) {
      statusKeluargaCtrl.value.text = res;
    } else {
      statusKeluargaCtrl.value.clear();
    }
  }

  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, maxTime: dt, currentTime: initDate);
  }

  void nextForm() async {
    if (formKey.currentState!.validate()) {
      var body = FormCutiModel();
      body.nikAtasan = nikAtasan.value;
      body.namaKaryawan = nama.value;
      body.nikKaryawan = nik.value;
      body.statusKawinKaryawan = statusKeluargaCtrl.value.text;
      body.statusKaryawan = statusKaryawanCtrl.value.text;
      body.tglMulaiBekerjaKaryawan = tglBekerjaCtrl.value.text;
      body.alamatKaryawan = alamatCtrl.value.text;

      var res =
          await Get.toNamed(Routes.TANGGAL_CUTI, arguments: {"data": body});
      if (res != null) {
        Get.back();
        Get.snackbar("Berhasil", "Berhasil Membuat Cuti Online",
            colorText: Colors.white, backgroundColor: Colors.green);
      }
    }
  }

  tapStatusKaryawan() async {
    var res = await Get.toNamed(Routes.STATUS_KARYAWAN);
    if (res != null) {
      statusKaryawanCtrl.value.text = res;
    }
  }
}
