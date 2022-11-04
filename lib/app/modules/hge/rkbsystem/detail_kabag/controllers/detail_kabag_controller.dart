import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/models/rkb_detail_models.dart';
import '../../../../../data/providers/provider.dart';

class DetailKabagController extends GetxController {
  final noRkbCtrl = TextEditingController();
  final partNameCtrl = TextEditingController();
  final subjectCtrl = TextEditingController();
  final pesanCtrl = TextEditingController();

  final noRkbFocus = FocusNode();
  final partNameFocus = FocusNode();
  final subjectFocus = FocusNode();
  final pesanFocus = FocusNode();
  final username = RxnString(null);
  final provider = Provider();
  final idHeader = RxnString();
  final noRkb = RxnString();
  final data = <RkbDetail>[].obs;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    idHeader.value = Get.arguments['idHeader'];
    noRkb.value = Get.arguments['noRkb'];

    getDetail();
    super.onInit();
  }



  getDetail() async {
    await provider.getRkbDetail(idHeader.value).then((value) {
      if (value.rkbDetail != null) {
        data.addAll(value.rkbDetail!);
      }
    });
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.name);
  }
}
