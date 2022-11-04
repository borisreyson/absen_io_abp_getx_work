import 'package:face_id_plus/app/data/providers/sarana_provider.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/models/listSaranaHeader.dart';

class P2hListSaranaController extends GetxController {
  final saranaProvider = SaranaProvider();
  final listSarana = <Data>[].obs;
  final page = 1.obs;
  final refreshController = RefreshController();
  final pullUp = true.obs;
  final lastPage = 1.obs;

  @override
  void onInit() {
    print("oN");
    getSarana(page.value);

    super.onInit();
  }

  getSarana(int? hal) async {
    saranaProvider.getSarana(hal).then((value) {
      if (value != null) {
        var res = value.unitSarana;
        if (res != null) {
          lastPage.value = res.lastPage!;
          listSarana.addAll(res.data!);
        }
      }
    }).whenComplete(() {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    });
  }

  void onLoading() {
    if (page.value < lastPage.value) {
      page.value++;
      pullUp.value = true;
      getSarana(page.value);
    } else {
      pullUp.value = false;
    }
  }

  void onRefresh() {
    listSarana.clear();
    page.value = 1;
    pullUp.value = true;

    getSarana(page.value);
  }
}
