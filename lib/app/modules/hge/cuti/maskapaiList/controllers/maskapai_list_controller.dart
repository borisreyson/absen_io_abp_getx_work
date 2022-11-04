import 'package:face_id_plus/app/modules/hge/cuti/models/maskapai_model.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:get/get.dart';

class MaskapaiListController extends GetxController {
  final provider = ProviderCuti();
  final data = <Data>[].obs;
  final loaded = false.obs;
  final page = 1.obs;
  final lastPage = 1.obs;
  final option = false.obs;
  
  @override
  void onInit() async {
    var ar = await Get.arguments;
    if (ar != null) {
      option.value = true;
    } else {
      option.value = false;
    }
    data.clear();
    getMaskapai(page.value);
    super.onInit();
  }

  getMaskapai(hal) async {
    await provider.maskapaiGet(page: hal).then((value) {
      var res = value.maskapai;
      if (res != null) {
        var response = res.data;
        if (response != null) {
          data.addAll(response);
        }
        lastPage.value = int.parse("${res.lastPage}");
      } else {}
      loaded.value = true;
    }).onError((error, stackTrace) {
      loaded.value = false;
    });
  }
}
