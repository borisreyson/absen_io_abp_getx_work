import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:get/get.dart';
import '../../../../data/models/kemungkinan_model.dart';
import '../../../../data/repository/repository_sqlite.dart';

class KemungkinanController extends GetxController {
  final repository = ReporsitoryKemungkinan();
  final data = <Kemungkinan>[].obs;
  final isLoading = true.obs;
  @override
  void onInit() async {
    await repository.getAll(table: Constants.kemungkinanTb).then((value) {
      for (var element in value) {
        data.add(element);
      }
    }).whenComplete(() => isLoading.value = false);
    super.onInit();
  }


  @override
  void onClose() {}
}
