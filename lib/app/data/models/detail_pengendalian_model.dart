class DetPengendalianModel {
  List<DetHirarki>? detHirarki;

  DetPengendalianModel({this.detHirarki});

  DetPengendalianModel.fromJson(Map<String, dynamic> json) {
    if (json['detHirarki'] != null) {
      detHirarki = <DetHirarki>[];
      json['detHirarki'].forEach((v) {
        detHirarki!.add(DetHirarki.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detHirarki != null) {
      data['detHirarki'] = detHirarki!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetHirarki {
  int? idKet;
  int? idHirarki;
  String? keterangan;
  String? ketInput;
  String? timeInput;

  DetHirarki(
      {this.idKet,
      this.idHirarki,
      this.keterangan,
      this.ketInput,
      this.timeInput});

  DetHirarki.fromJson(Map<String, dynamic> json) {
    idKet = json['id_ket'];
    idHirarki = json['id_hirarki'];
    keterangan = json['keterangan'];
    ketInput = json['ket_input'];
    timeInput = json['time_input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_ket'] = idKet;
    data['id_hirarki'] = idHirarki;
    data['keterangan'] = keterangan;
    data['ket_input'] = ketInput;
    data['time_input'] = timeInput;
    return data;
  }
}
