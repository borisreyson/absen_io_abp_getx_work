import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/sarana_models.dart';
import '../../../../../data/providers/provider.dart';

class NomorLambungController extends GetxController {
  final provider = Provider();
  Widget? searchBar = const Text("List Sarana");
  final cari = false.obs;
  final cariFocus = FocusNode();
  final cariController = TextEditingController();
  final listSaranan = <Sarana>[].obs;

  @override
  void onInit() {
    getSarana();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void cariUser(String? cari) async {}
  getSarana({String? cari}) async {
    await provider.getSarana(cari).then((value) {
      if (value != null) {
        var sarana = value.sarana;
        if (sarana != null) {
          listSaranan.addAll(sarana);
        }
      }
    });
  }
}
