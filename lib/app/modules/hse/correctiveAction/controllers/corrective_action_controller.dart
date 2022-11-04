import 'package:face_id_plus/app/data/models/counter_hazard.dart';
import 'package:face_id_plus/app/data/models/user_profile.dart';
import 'package:face_id_plus/app/data/repository/repository_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/utils/constants.dart';

class CorrectiveActionController extends GetxController {
  final userRepository = UsersRepository();
  final hazardRepository = HazardRepository();
  final fullName = ''.obs,
      nik = ''.obs,
      dept = ''.obs,
      company = ''.obs,
      profile = UserProfileModel().obs,
      username = ''.obs,
      rule = [].obs,
      tglSekarang = ''.obs;
  final isLoading = true.obs;
  String? fotoProfile;
  var dt = DateTime.now();
  var fmt = DateFormat('dd MMMM yyyy');
  final Color hazardMenu = const Color.fromARGB(255, 74, 112, 13);
  final BoxDecoration gradient = const BoxDecoration(
      gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 14, 189, 104),
      Color.fromARGB(255, 5, 117, 2),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ));
  final userCounter = CounterHazard().obs;
  @override
  void onInit() async {
    getPref();

    super.onInit();
  }

  @override
  void onClose() {}

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    username.value = "${pref.getString(Constants.username)}";
    rule.value = "${pref.getString(Constants.rule)}".split(",");
    nik.value = "${pref.getString(Constants.nik)}";
    fotoProfile = "${pref.getString(Constants.fotoProfile)}";
    getRepository();
  }

  getRepository() async {
    isLoading.value = true;
    await userRepository.fetchUserProfile(username).then((value) {
      if (value != null) {
        profile.value = value;
      }
    });
    await hazardRepository.counterHazard(username, nik).then((value) {
      if (value != null) {
        userCounter.value = value;
      }
    }).whenComplete(() {
      tglSekarang.value = fmt.format(dt);
      isLoading.value = false;
    });
  }
}
