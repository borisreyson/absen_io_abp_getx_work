import 'package:face_id_plus/app/data/models/p2h_sarana_models.dart';
import 'package:face_id_plus/app/data/providers/p2h_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../data/models/listSaranaHeader.dart' as header;

class ListP2hSarprasController extends GetxController {
  final provider = P2hProvider();
  final page = 1.obs;
  final dataP2h = <Data>[].obs;
  final lastPage = 1.obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final loaded = false.obs;
  @override
  void onInit() async {
    page.value = 1;
    lastPage.value = 1;
    dataP2h.clear();
    var argumen = await Get.arguments;
    if (argumen != null) {
      var res = argumen['dataSarana'];
      if (res != null) {
        header.Data e = res;
        getP2hSaranaId(page.value, "${e.saranaId}");
      } else {
        getP2hSarana(page.value);
      }
    } else {
      getP2hSarana(page.value);
    }

    super.onInit();
  }

  getP2hSarana(hal) async {
    await provider.getAllP2hSarpras(hal).then((value) {
      var resultSarana = value.p2hSarana;
      if (resultSarana != null) {
        lastPage.value = resultSarana.lastPage!;
        dataP2h.addAll(resultSarana.data!);
      }
    }).whenComplete(() => loaded.value = true);
  }

  getP2hSaranaId(hal, saranaId) async {
    await provider.getAllP2hSarprasId(hal, saranaId).then((value) {
      var resultSarana = value.p2hSarana;
      if (resultSarana != null) {
        lastPage.value = resultSarana.lastPage!;
        dataP2h.addAll(resultSarana.data!);
      }
    }).whenComplete(() => loaded.value = true);
  }
}
