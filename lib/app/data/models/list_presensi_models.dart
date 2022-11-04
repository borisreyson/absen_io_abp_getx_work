import 'package:face_id_plus/app/data/models/last_absen_model.dart';

class ListPresensiModels {
  List<Presensi>? listPresensi;

  ListPresensiModels({this.listPresensi});

  ListPresensiModels.fromJson(Map<String, dynamic> json) {
    if (json['listPresensi'] != null) {
      listPresensi = <Presensi>[];
      json['listPresensi'].forEach((v) {
        listPresensi!.add(Presensi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listPresensi != null) {
      data['listPresensi'] = listPresensi?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
