import 'package:get/get.dart';

import '../../../../data/providers/register_provider.dart';

class DevisiController extends GetxController {
  final provider = ListDataKaryawan();
  final listDevisi = <ListDevisi>[].obs;
  final loaded = false.obs;
  @override
  void onInit() async {
    var idDept = await Get.arguments['idDept'];
    if (idDept != null) {
      getDevisi(idDept);
    }
    super.onInit();
  }

  getDevisi(idDept) async {
    await provider.getDevisi(idDept).then((value) {
      var devisi = value.devisi;
      if (devisi != null) {
        listDevisi.addAll(devisi);
        loaded.value = true;
      }
    });
  }
}
