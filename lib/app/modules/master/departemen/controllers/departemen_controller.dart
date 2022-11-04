import 'package:face_id_plus/app/data/providers/register_provider.dart';
import 'package:get/get.dart';

class DepartemenController extends GetxController {
  final provider = ListDataKaryawan();
  final listDept = <ListDepartemen>[].obs;
  final loaded = false.obs;
  @override
  void onInit() {
    getDept();
    super.onInit();
  }

  getDept() async {
    await provider.getDepartemen().then((value) {
      var dept = value.departemen;
      if (dept != null) {
        listDept.addAll(dept);
        loaded.value = true;
      }
    });
  }
}
