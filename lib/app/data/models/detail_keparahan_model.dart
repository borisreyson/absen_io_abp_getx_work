class DetailKeparahanModel {
  List<DetKeparahan>? detKeparahan;

  DetailKeparahanModel({this.detKeparahan});

  DetailKeparahanModel.fromJson(Map<String, dynamic> json) {
    if (json['det_keparahan'] != null) {
      detKeparahan = <DetKeparahan>[];
      json['det_keparahan'].forEach((v) {
        detKeparahan!.add(DetKeparahan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detKeparahan != null) {
      data['det_keparahan'] = detKeparahan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetKeparahan {
  int? idDet;
  int? idKeparahan;
  String? keterangan;
  String? ketInput;
  String? timeInput;

  DetKeparahan(
      {this.idDet,
      this.idKeparahan,
      this.keterangan,
      this.ketInput,
      this.timeInput});

  DetKeparahan.fromJson(Map<String, dynamic> json) {
    idDet = json['id_det'];
    idKeparahan = json['idKeparahan'];
    keterangan = json['keterangan'];
    ketInput = json['ket_input'];
    timeInput = json['time_input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_det'] = idDet;
    data['idKeparahan'] = idKeparahan;
    data['keterangan'] = keterangan;
    data['ket_input'] = ketInput;
    data['time_input'] = timeInput;
    return data;
  }
}
