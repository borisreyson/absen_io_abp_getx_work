class KeparahanResiko {
  List<Keparahan>? keparahan;

  KeparahanResiko({this.keparahan});

  KeparahanResiko.fromJson(Map<String, dynamic> json) {
    if (json['keparahan'] != null) {
      keparahan = <Keparahan>[];
      json['keparahan'].forEach((v) {
        keparahan!.add(Keparahan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (keparahan != null) {
      data['keparahan'] = keparahan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Keparahan {
  int? idKeparahan;
  String? keparahan;
  int? nilai;
  int? flag;
  String? keparahanUpdate;

  Keparahan(
      {this.idKeparahan,
      this.keparahan,
      this.nilai,
      this.flag,
      this.keparahanUpdate});

  Keparahan.fromJson(Map<String, dynamic> json) {
    idKeparahan = json['idKeparahan'];
    keparahan = json['keparahan'];
    nilai = json['nilai'];
    flag = json['flag'];
    keparahanUpdate = json['keparahan_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idKeparahan'] = idKeparahan;
    data['keparahan'] = keparahan;
    data['nilai'] = nilai;
    data['flag'] = flag;
    data['keparahan_update'] = keparahanUpdate;
    return data;
  }
}
