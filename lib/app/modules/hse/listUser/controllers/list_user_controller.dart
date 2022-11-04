import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/users_model.dart';
import '../../../../data/repository/repository_sqlite.dart';

class ListUserController extends GetxController {
  final repository = RepositoryUsers();
  Widget? searchBar = const Text("Penanggung Jawab");
  final cari = false.obs;
  final cariFocus = FocusNode();
  final data = <UsersList>[].obs;
  final cariController = TextEditingController();

  @override
  void onInit() async {
    await repository.getAll(table: Constants.usersTb).then((value) {
      data.addAll(value);
    });
    super.onInit();
  }


  @override
  void onClose() {}
  cariUser(String? cari) async {
    data.clear();
    if (cari != null) {
      await repository
          .cariNama(table: Constants.usersTb, nama: cari)
          .then((value) {
        data.addAll(value);
      });
    } else {
      await repository.getAll(table: Constants.usersTb).then((value) {
        data.addAll(value);
      });
    }
  }
}
