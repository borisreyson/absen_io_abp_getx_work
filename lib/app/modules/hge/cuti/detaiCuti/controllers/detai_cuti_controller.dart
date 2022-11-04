import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:get/get.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart'
    as cuti_model;
import 'package:intl/intl.dart';

class DetaiCutiController extends GetxController {
  final provider = ProviderCuti();
  final dataCuti = cuti_model.Data().obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final tiketCuti = <TiketCuti>[].obs;
  final jam = DateFormat("HH:mm:ss");
  final loaded = false.obs;
  @override
  void onInit() async {
    var ar = await Get.arguments['data'];
    if (ar != null) {
      dataCuti.value = ar;
      getTiketCuti(dataCuti.value.idCutiOnline);
    }
    super.onInit();
  }

  getTiketCuti(idCutiOnline) async {
    await provider.getCutiTiket(idCutiOnline: idCutiOnline).then((value) {
      var res = value.tiketCuti;
      if (res != null) {
        tiketCuti.addAll(res);
        loaded.value = true;
      } else {
        loaded.value = false;
      }
    });
  }
}
