import 'package:face_id_plus/app/data/models/kemungkinan_model.dart';
import 'package:face_id_plus/app/data/models/keparahan_model.dart';
import 'package:face_id_plus/app/data/models/metrik_resiko_model.dart';
import 'package:get/get.dart';

import '../../../../data/models/data_hazard.dart';
import '../../../../data/repository/repository_api.dart';
import '../../../../data/services/service.dart';

class DetailHazardController extends GetxController {
  final repository = HazardRepository();
  final KemungkinanService kmService = KemungkinanService();
  final KeparahanService kpService = KeparahanService();
  final MetrikService metrikService = MetrikService();
  final String baseImage = "https://abpjobsite.com/bukti_hazard/";
  String perusahaan = "Perusahaan";
  final data = Data().obs;
  int? nilaiKpSebelum, nilaiKmSesudah, nilaiKpSesudah;
  final resikoSebelum = MetrikResiko().obs;
  final resikoSesudah = MetrikResiko().obs;

  final kmSebelum = Kemungkinan().obs;
  final kpSebelum = Keparahan().obs;
  final kmSesudah = Kemungkinan().obs;
  final kpSesudah = Keparahan().obs;
  RxnString bukti = RxnString(null);
  final updateBukti = RxnString(null);

  @override
  void onInit() async {
    data.value = Get.arguments['detail'] as Data;
    await getResikoSebelum(data: data.value);
    if (data.value.idKemungkinanSesudah != null) {
      await getResikoSesudah(data: data.value);
    }
    super.onInit();
  }

  @override
  void onReady() {
    bukti.value = "$baseImage${data.value.bukti}";
    updateBukti.value = "${baseImage}update/${data.value.updateBukti}";
    super.onReady();
  }

  @override
  void onClose() {}

  getResikoSebelum({required Data data}) async {
    kmSebelum.value = await kmService.getBy(idKemungkinan: data.idKemungkinan);
    kpSebelum.value = await kpService.getBy(idKeparahan: data.idKeparahan);
    resikoSebelum.value = await metrikService.getBy(
        nilai: (kmSebelum.value.nilai! * kpSebelum.value.nilai!));
  }

  getResikoSesudah({required Data data}) async {
    kmSesudah.value =
        await kmService.getBy(idKemungkinan: data.idKemungkinanSesudah);
    kpSesudah.value =
        await kpService.getBy(idKeparahan: data.idKeparahanSesudah);
    resikoSesudah.value = await metrikService.getBy(
        nilai: (kmSesudah.value.nilai! * kpSesudah.value.nilai!));
  }
}
