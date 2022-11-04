import 'package:face_id_plus/app/data/models/sarpras_list.dart';

class SarprasDetail {
  Data? sarpras;

  SarprasDetail({this.sarpras});

  SarprasDetail.fromJson(Map<String, dynamic> json) {
    sarpras = json['sarpras'] != null ? Data.fromJson(json['sarpras']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sarpras != null) {
      data['sarpras'] = sarpras!.toJson();
    }
    return data;
  }
}
