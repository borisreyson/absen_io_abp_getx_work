import 'package:face_id_plus/app/data/services/service.dart';
import 'package:get/get.dart';

import '../../../../../data/models/master_pemeriksaan_model.dart';
import '../../../../../data/models/p2h_sarana_mode.dart';

class DetailPemeriksaanP2HController extends GetxController {
  final servicePeriksa = P2HPemeriksaanService();
  final serviceTemuan = P2HTemuanPemeriksaanService();
  final serviceKondisi = P2HKondisiService();
  final data = MasterPemeriksaan().obs;
  final header = P2HSaranaModel().obs;
  final loaded = false.obs;
  final tersedia = RxnString(null);
  final kondisinya = RxnString(null);
  final keterangannya = RxnString(null);
  final gambarKondisi = RxnString(null);
  final basUrl =
      "https://lp.abpjobsite.com/api/v1/p2h/view/p2h/image?file_name=";
  @override
  void onInit() async {
    var res = await Get.arguments['data'];
    var result = await Get.arguments['header'];
    if (res != null && result != null) {
      data.value = res;
      header.value = result;
      cekKetersediaan();
      cekKondisi();
      loaded.value = true;
    } else {
      loaded.value = false;
    }
    super.onInit();
  }

  void ketersediaan(String s) async {
    var pm = P2HPemeriksaanModel();
    pm.idHeader = header.value.idHeader;
    pm.idDetail = data.value.idPemeriksaan;
    pm.ketersediaan = s;
    var res = await servicePeriksa.save(pm);
    if (res > 0) {
      cekKetersediaan();
    }
  }

  cekKetersediaan() async {
    await servicePeriksa
        .getByIdDetail(
            idDetail: data.value.idPemeriksaan, idHeader: header.value.idHeader)
        .then((value) {
      if (value != null) {
        tersedia.value = value.ketersediaan;
      }
    });
  }

  void kondisi(String s) async {
    var pm = P2HPemeriksaanModel();
    pm.idHeader = header.value.idHeader;
    pm.idDetail = data.value.idPemeriksaan;
    pm.kondisi = s;
    pm.gambar = null;
    var res = await serviceKondisi.save(pm);
    if (res > 0) {
      cekKondisi();
    }
  }

  cekKondisi() async {
    await serviceKondisi
        .getByIdDetail(
            idDetail: data.value.idPemeriksaan, idHeader: header.value.idHeader)
        .then((value) {
      if (value != null) {
        kondisinya.value = value.kondisi;
        keterangannya.value = value.keterangan;
        gambarKondisi.value = value.gambar;
      }
    });
  }
}
