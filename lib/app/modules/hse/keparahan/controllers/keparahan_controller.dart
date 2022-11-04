import 'package:face_id_plus/app/data/models/detail_keparahan_model.dart';
import 'package:face_id_plus/app/data/models/keparahan_model.dart';
import 'package:face_id_plus/app/data/repository/repository_sqlite.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:get/get.dart';

class KeparahanController extends GetxController {
  final repository = RepositoryKeparahan();
  final repositoryDet = RepositoryDetKeparahan();
  final data = <Keparahan>[].obs;

  final listDetKeparahan = [<DetKeparahan>[]].obs;
  final isLoading = true.obs;
  final idKeparahan = [].obs;

  @override
  void onInit() async {
    await repository.getAll(table: Constants.keparahanTb).then((value) async {
      for (var element in value) {
        idKeparahan.add(element.idKeparahan);
        data.add(element);
      }
    }).whenComplete(() {
      loadDetKeparahan(idKeparahan);

      isLoading.value = false;
    });
    super.onInit();
  }


  @override
  void onClose() {}
  loadDetKeparahan(idKeparahan) async {
    if (idKeparahan!.isNotEmpty) {
      for (int id in idKeparahan!) {
        var res = await repositoryDet.getById(
            table: Constants.detKeparahanTb, idKep: id);
        listDetKeparahan.add(res);
      }
    }
  }
}
