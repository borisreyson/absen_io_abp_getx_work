class P2HDataModels {
  P2HSaranaModel? saranaHeader;
  List<P2HPemeriksaanModel?>? pemeriksaan;
  P2HDataModels({this.saranaHeader, this.pemeriksaan});
  factory P2HDataModels.fromJson(Map<String, dynamic> json) {
    return P2HDataModels(
      saranaHeader: json['saranaHeader'],
      pemeriksaan: (json['pemeriksaan'] != null)
          ? (json["pemeriksaan"] as List)
              .map((b) => P2HPemeriksaanModel.fromJson(b))
              .toList()
          : [],
    );
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    // ignore: unrelated_type_equality_checks
    if (saranaHeader != String) {
      data['saranaHeader'] = saranaHeader?.toJson();
    }
    // ignore: unrelated_type_equality_checks
    if (pemeriksaan != String) {
      data['pemeriksaan'] = pemeriksaan!.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class P2HSaranaModel {
  int? idHeader;
  String? noPol;
  String? noLv;
  String? shift;
  String? hmKmAwal;
  String? hmKmAkhir;
  String? userInput;
  String? tglInput;
  String? jamInput;
  P2HSaranaModel(
      {this.idHeader,
      this.noPol,
      this.noLv,
      this.shift,
      this.hmKmAwal,
      this.hmKmAkhir,
      this.userInput,
      this.tglInput,
      this.jamInput});
  factory P2HSaranaModel.fromJson(Map<String, dynamic> json) {
    return P2HSaranaModel(
      idHeader: json['idHeader'],
      noPol: json['no_pol'],
      noLv: json['no_lv'],
      shift: json['shift'],
      hmKmAwal: json['hm_km_awal'],
      hmKmAkhir: json['hm_km_akhir'],
      userInput: json['user_input'],
      tglInput: json['tgl_input'],
      jamInput: json['jam_input'],
    );
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['idHeader'] = "$idHeader";
    data['no_pol'] = noPol;
    data['no_lv'] = noLv;
    data['shift'] = shift;
    data['hm_km_awal'] = hmKmAwal;
    data['hm_km_akhir'] = hmKmAkhir;
    data['user_input'] = userInput;
    data['tgl_input'] = tglInput;
    data['jam_input'] = jamInput;
    return data;
  }
}

class P2HPemeriksaanModel {
  int? idPemeriksaan;
  int? idHeader;
  int? idDetail;
  String? pemeriksaaan;
  String? ketersediaan;
  String? kondisi;
  String? keterangan;
  String? gambar;
  P2HPemeriksaanModel(
      {this.idPemeriksaan,
      this.idHeader,
      this.idDetail,
      this.pemeriksaaan,
      this.ketersediaan,
      this.kondisi,
      this.keterangan,
      this.gambar});

  factory P2HPemeriksaanModel.fromJson(Map<String, dynamic> json) {
    return P2HPemeriksaanModel(
        idPemeriksaan: json['idPemeriksaan'],
        idHeader: json['idHeader'],
        idDetail: json['idDetail'],
        pemeriksaaan: json['pemeriksaaan'],
        ketersediaan: json['ketersediaan'],
        kondisi: json['kondisi'],
        keterangan: json['keterangan'],
        gambar: json['gambar']);
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['idPemeriksaan'] = idPemeriksaan;
    data['idHeader'] = idHeader;
    data['idDetail'] = idDetail;
    data['pemeriksaaan'] = pemeriksaaan;
    data['ketersediaan'] = ketersediaan;
    data['kondisi'] = kondisi;
    data['keterangan'] = keterangan;
    data['gambar'] = gambar;
    return data;
  }
}

class UpdateP2hHmKm {
  String? p2hId;
  String? hmKmAkhir;
  String? userUpdate;
  UpdateP2hHmKm({
    this.p2hId,
    this.hmKmAkhir,
    this.userUpdate,
  });

  factory UpdateP2hHmKm.fromJson(Map<String, dynamic> json) {
    return UpdateP2hHmKm(
        p2hId: json['p2hId'],
        hmKmAkhir: json['hmKmAkhir'],
        userUpdate: json['userUpdate']);
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['p2hId'] = p2hId;
    data['hmKmAkhir'] = hmKmAkhir;
    data['userUpdate'] = userUpdate;
    return data;
  }
}