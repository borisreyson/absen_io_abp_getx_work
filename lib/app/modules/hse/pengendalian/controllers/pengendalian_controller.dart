import 'package:face_id_plus/app/data/models/pengendalian.dart';
import 'package:face_id_plus/app/data/repository/repository_sqlite.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/models/detail_pengendalian_model.dart';
import '../../../../data/utils/constants.dart';

class PengendalianController extends GetxController {
  final repository = RepositoryPengendalian();
  final repositoryDet = RepositoryDetPengendalian();
  final detHirarki = [<DetHirarki>[]].obs;
  final data = <Hirarki>[];
  final idHirarki = [].obs;
  final isLoading = true.obs;
  @override
  void onInit() async {
    await repository.getAll(table: Constants.pengendalianTb).then((value) {
      for (var e in value) {
        idHirarki.add(e.idHirarki);
        if (kDebugMode) {
          print("value ${e.idHirarki}");
        }
        data.add(e);
      }
    }).whenComplete(() {
      loadPegendalian(idHirarki);
      isLoading.value = false;
    });
    super.onInit();
  }


  @override
  void onClose() {}
  loadPegendalian(idHirarki) async {
    if (idHirarki!.isNotEmpty) {
      for (int id in idHirarki) {
        await repositoryDet
            .getById(table: Constants.detPengendalianTb, idHirarki: id)
            .then((List<DetHirarki>? value) {
          if (value != null) {
            detHirarki.add(value);
          }
        });
      }
    }
  }
}
