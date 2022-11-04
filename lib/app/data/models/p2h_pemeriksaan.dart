class P2hPemeriksaanModel {
  List<P2hPemeriksaan>? p2hPemeriksaaan;

  P2hPemeriksaanModel({this.p2hPemeriksaaan});

  P2hPemeriksaanModel.fromJson(Map<String, dynamic> json) {
    if (json['p2hPemeriksaan'] != null) {
      p2hPemeriksaaan = <P2hPemeriksaan>[];
      json['p2hPemeriksaan'].forEach((v) {
        p2hPemeriksaaan!.add(P2hPemeriksaan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (p2hPemeriksaaan != null) {
      data['p2hPemeriksaaan'] =
          p2hPemeriksaaan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class P2hPemeriksaan {
  int? p2hIdDetail;
  String? p2hUniqid;
  int? p2hId;
  String? p2hKetersediaan;
  String? p2hKondisi;
  String? p2hKeterangan;
  int? idPemeriksaan;
  String? diperiksa;
  int? flagPemeriksaan;
  String? userInput;
  String? timeInput;

  P2hPemeriksaan(
      {this.p2hIdDetail,
      this.p2hUniqid,
      this.p2hId,
      this.p2hKetersediaan,
      this.p2hKondisi,
      this.p2hKeterangan,
      this.idPemeriksaan,
      this.diperiksa,
      this.flagPemeriksaan,
      this.userInput,
      this.timeInput});

  P2hPemeriksaan.fromJson(Map<String, dynamic> json) {
    p2hIdDetail = json['p2h_id_detail'];
    p2hUniqid = json['p2h_uniqid'];
    p2hId = json['p2h_id'];
    p2hKetersediaan = json['p2h_ketersediaan'];
    p2hKondisi = json['p2h_kondisi'];
    p2hKeterangan = json['p2h_keterangan'];
    idPemeriksaan = json['idPemeriksaan'];
    diperiksa = json['diperiksa'];
    flagPemeriksaan = json['flagPemeriksaan'];
    userInput = json['userInput'];
    timeInput = json['timeInput'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['p2h_id_detail'] = p2hIdDetail;
    data['p2h_uniqid'] = p2hUniqid;
    data['p2h_id'] = p2hId;
    data['p2h_ketersediaan'] = p2hKetersediaan;
    data['p2h_kondisi'] = p2hKondisi;
    data['p2h_keterangan'] = p2hKeterangan;
    data['idPemeriksaan'] = idPemeriksaan;
    data['diperiksa'] = diperiksa;
    data['flagPemeriksaan'] = flagPemeriksaan;
    data['userInput'] = userInput;
    data['timeInput'] = timeInput;
    return data;
  }
}
