class LokasiModel {
  List<Lokasi>? lokasi;

  LokasiModel({this.lokasi});

  LokasiModel.fromJson(Map<String, dynamic> json) {
    if (json['lokasi'] != null) {
      lokasi = <Lokasi>[];
      json['lokasi'].forEach((v) {
        lokasi!.add(Lokasi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lokasi != null) {
      data['lokasi'] = lokasi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lokasi {
  int? idLok;
  String? lokasi;
  String? desLokasi;
  String? userInput;
  String? tglInput;

  Lokasi(
      {this.idLok, this.lokasi, this.desLokasi, this.userInput, this.tglInput});

  Lokasi.fromJson(Map<String, dynamic> json) {
    idLok = json['idLok'];
    lokasi = json['lokasi'];
    desLokasi = json['des_lokasi'];
    userInput = json['userInput'];
    tglInput = json['tgl_input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idLok'] = idLok;
    data['lokasi'] = lokasi;
    data['des_lokasi'] = desLokasi;
    data['userInput'] = userInput;
    data['tgl_input'] = tglInput;
    return data;
  }
}
