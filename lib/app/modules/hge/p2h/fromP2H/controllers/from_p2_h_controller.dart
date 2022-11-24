import 'package:face_id_plus/app/data/providers/sarana_provider.dart';
import 'package:face_id_plus/app/data/services/service.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/models/detail_sarana_model.dart';
import '../../../../../data/models/listSaranaHeader.dart';
import '../../../../../data/models/p2h_sarana_mode.dart';

class FromP2HController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final provider = SaranaProvider();
  final service = P2HSaranaService();

  final Color warna = const Color.fromARGB(255, 32, 72, 142);

  final data = Data().obs;
  final detailSarana = DetailSarana().obs;
  final loaded = false.obs;
  final saranaId = RxnString(null);
  final noPol = RxnString(null);

  final noPolCtrl = TextEditingController().obs;
  final noLvCtrl = TextEditingController().obs;
  final shiftCtrl = TextEditingController().obs;
  final hmKmAwalCtrl = TextEditingController().obs;

  final noPolFocus = FocusNode();
  final noLvFocus = FocusNode();
  final shiftFocus = FocusNode();
  final hmKmAwalFocus = FocusNode();

  final username = RxnString(null);
  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
    var res = await Get.arguments['data'];
    if (res != null) {
      data.value = res;
      saranaId.value = "${data.value.saranaId}";
      noPolCtrl.value.text = "${data.value.noPol}";
      noLvCtrl.value.text = "${data.value.noLv}";

      await getLokal();
    } else {
      loaded.value = false;
    }

    var scanner = await Get.arguments['saranaId'];
    print("sarana ${scanner}");
    if (scanner != null) {
      saranaId.value = scanner[0];
      noPol.value = scanner[1];
      getDetailSarana(saranaId.value);
    }
    super.onInit();
  }

  getDetailSarana(no) async {
    await provider.getDetailSarana(no).then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        var sarana = value.detailSarana;
        if (sarana != null) {
          noPolCtrl.value.text = "${sarana.noPol}";
          noLvCtrl.value.text = "${sarana.noLv}";
          detailSarana.value = sarana;
          getLokal();
        } else {
          loaded.value = false;
        }
      } else {
        loaded.value = false;
      }
    }).onError((error, stackTrace) {
      loaded.value = false;
    });
  }

  simpanLokal() async {
    if (formKey.currentState!.validate()) {
      var dt = DateTime.now();
      DateFormat fmt = DateFormat('dd MMMM yyyy');

      var data = P2HSaranaModel();
      data.idHeader = int.parse("${saranaId.value}");
      data.noPol = noPolCtrl.value.text;
      data.noLv = noLvCtrl.value.text;
      data.shift = shiftCtrl.value.text;
      data.hmKmAwal = hmKmAwalCtrl.value.text;
      data.tglInput = fmt.format(dt);
      data.jamInput = "${dt.hashCode}:${dt.minute}:${dt.second}";
      data.userInput = username.value;

      var post = await service.save(data);
      if (post > 0) {
        Get.toNamed(Routes.DAFTAR_PEMERIKSAAN_P2_H,
            arguments: {"header": data.idHeader});
      }
    }
  }

  getLokal() async {
    await service
        .getFirstId(idHeader: int.parse("${saranaId.value}"))
        .then((value) {
      shiftCtrl.value.text = value?.shift ?? "";
      hmKmAwalCtrl.value.text = value?.hmKmAwal ?? "";
      loaded.value = true;
    });
  }
}
