class KemungkinanResiko {
  List<Kemungkinan>? kemungkinan;

  KemungkinanResiko({this.kemungkinan});

  KemungkinanResiko.fromJson(Map<String, dynamic> json) {
    if (json['kemungkinan'] != null) {
      kemungkinan = <Kemungkinan>[];
      json['kemungkinan'].forEach((v) {
        kemungkinan!.add(Kemungkinan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (kemungkinan != null) {
      data['kemungkinan'] = kemungkinan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kemungkinan {
  int? idKemungkinan;
  String? kemungkinan;
  String? keterangan;
  int? nilai;
  int? flag;
  String? kemungkinanUpdate;

  Kemungkinan(
      {this.idKemungkinan,
      this.kemungkinan,
      this.keterangan,
      this.nilai,
      this.flag,
      this.kemungkinanUpdate});

  Kemungkinan.fromJson(Map<String, dynamic> json) {
    idKemungkinan = json['idKemungkinan'];
    kemungkinan = json['kemungkinan'];
    keterangan = json['keterangan'];
    nilai = json['nilai'];
    flag = json['flag'];
    kemungkinanUpdate = json['kemungkinan_update'];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['idKemungkinan'] = idKemungkinan;
    data['kemungkinan'] = kemungkinan;
    data['keterangan'] = keterangan;
    data['nilai'] = nilai;
    data['flag'] = flag;
    data['kemungkinan_update'] = kemungkinanUpdate;
    return data;
  }
}
