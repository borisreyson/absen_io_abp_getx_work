import 'package:face_id_plus/app/data/providers/sarana_provider.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahSaranaController extends GetxController {
  final noPolCtrl = TextEditingController().obs;
  final noLvCtrl = TextEditingController();
  final picCtrl = TextEditingController();
  final merekTipeCtrl = TextEditingController();
  final jenisCtrl = TextEditingController();
  final modelCtrl = TextEditingController();
  final thnPembuatanCtrl = TextEditingController();
  final isiSlinderCtrl = TextEditingController();
  final warnaKBCtrl = TextEditingController();
  final warnaTNKBCtrl = TextEditingController();

  final noPolFocus = FocusNode();
  final noLvFocus = FocusNode();
  final picFocus = FocusNode();
  final merekTipeFocus = FocusNode();
  final jenisFocus = FocusNode();
  final modeFocus = FocusNode();
  final thnPembuatanFocus = FocusNode();
  final isiSlinderFocus = FocusNode();
  final warnaKBFocus = FocusNode();
  final warnaTNKBFocus = FocusNode();

  final nikPic = RxnString(null);
  final username = RxnString(null);

  final formKey = GlobalKey<FormState>();
  final provider = SaranaProvider();
  @override
  void onInit() async {
    getPref();
    noPolFocus.requestFocus();
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
  }

  simpan() async {
    if (formKey.currentState!.validate()) {
      var body = TambahSaranaData();
      body.noPol = noPolCtrl.value.text;
      body.noLv = noLvCtrl.text;
      body.picLv = nikPic.value;
      body.merkTipeLv = merekTipeCtrl.text;
      body.jenisLv = jenisCtrl.text;
      body.modelLv = modelCtrl.text;
      body.thnPembuatanLv = thnPembuatanCtrl.text;
      body.isiSlinderLv = isiSlinderCtrl.text;
      body.warnaKbLv = warnaKBCtrl.text;
      body.warnaTnkbLv = warnaTNKBCtrl.text;
      body.username = username.value;
      print("data ${body.picLv}");
      await provider.tambahSarana(body).then((value) {
        if (value != null) {
          var success = value.success;
          if (success != null) {
            Get.back(result: true);
            Get.snackbar("Success", "Data Telah Di Ditambah ${value.success}",
                backgroundColor: Colors.green, colorText: Colors.white);
          } else {
            Get.back(result: false);
            Get.snackbar("Gagal", "Gagal Di Ditambah ${value.success}",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        } else {
          Get.back(result: false);
          Get.snackbar("Gagal", "Gagal Di Ditambah ${value.success}",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
    }
  }
}

class TambahSaranaData {
  String? noPol;
  String? noLv;
  String? picLv;
  String? merkTipeLv;
  String? jenisLv;
  String? modelLv;
  String? thnPembuatanLv;
  String? isiSlinderLv;
  String? warnaKbLv;
  String? warnaTnkbLv;
  String? username;
  TambahSaranaData(
      {this.noPol,
      this.noLv,
      this.picLv,
      this.merkTipeLv,
      this.jenisLv,
      this.modelLv,
      this.thnPembuatanLv,
      this.isiSlinderLv,
      this.warnaKbLv,
      this.warnaTnkbLv,
      this.username});
  factory TambahSaranaData.fromJson(Map<String, dynamic> json) {
    return TambahSaranaData(
      noPol: json['noPol'],
      noLv: json['noLv'],
      picLv: json['picLv'],
      merkTipeLv: json['merekTipeLv'],
      jenisLv: json['jenisLv'],
      modelLv: json['modelLv'],
      thnPembuatanLv: json['thnPembuatanLv'],
      isiSlinderLv: json['isiSlinderLv'],
      warnaKbLv: json['warnaKbLv'],
      warnaTnkbLv: json['warnaTnkbLv'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['noPol'] = noPol;
    data['noLv'] = noLv;
    data['picLv'] = picLv;
    data['merekTipeLv'] = merkTipeLv;
    data['jenisLv'] = jenisLv;
    data['modelLv'] = modelLv;
    data['thnPembuatanLv'] = thnPembuatanLv;
    data['isiSlinderLv'] = isiSlinderLv;
    data['warnaKbLv'] = warnaKbLv;
    data['warnaTnkbLv'] = warnaTnkbLv;
    data['username'] = username;
    return data;
  }
}
