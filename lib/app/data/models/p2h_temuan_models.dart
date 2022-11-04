class P2hTemuanModel {
  List<P2hTemuan>? p2hTemuan;

  P2hTemuanModel({this.p2hTemuan});

  P2hTemuanModel.fromJson(Map<String, dynamic> json) {
    if (json['p2hTemuan'] != null) {
      p2hTemuan = <P2hTemuan>[];
      json['p2hTemuan'].forEach((v) {
        p2hTemuan!.add(P2hTemuan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (p2hTemuan != null) {
      data['p2hTemuan'] = p2hTemuan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class P2hTemuan {
  int? p2hIdBuktiTemuan;
  int? p2hIdDetail;
  String? p2hUniqid;
  String? p2hFotoTemuan;
  String? p2hKeteranganPerbaikan;
  int? p2hStatus;
  int? idPemeriksaan;
  String? diperiksa;
  int? flagPemeriksaan;
  String? userInput;
  String? timeInput;
  int? p2hId;
  String? p2hKetersediaan;
  String? p2hKondisi;
  String? p2hKeterangan;

  P2hTemuan(
      {this.p2hIdBuktiTemuan,
      this.p2hIdDetail,
      this.p2hUniqid,
      this.p2hFotoTemuan,
      this.p2hKeteranganPerbaikan,
      this.p2hStatus,
      this.idPemeriksaan,
      this.diperiksa,
      this.flagPemeriksaan,
      this.userInput,
      this.timeInput,
      this.p2hId,
      this.p2hKetersediaan,
      this.p2hKondisi,
      this.p2hKeterangan});

  P2hTemuan.fromJson(Map<String, dynamic> json) {
    p2hIdBuktiTemuan = json['p2h_id_bukti_temuan'];
    p2hIdDetail = json['p2h_id_detail'];
    p2hUniqid = json['p2h_uniqid'];
    p2hFotoTemuan = json['p2h_foto_temuan'];
    p2hKeteranganPerbaikan = json['p2h_keterangan_perbaikan'];
    p2hStatus = json['p2h_status'];
    idPemeriksaan = json['idPemeriksaan'];
    diperiksa = json['diperiksa'];
    flagPemeriksaan = json['flagPemeriksaan'];
    userInput = json['userInput'];
    timeInput = json['timeInput'];
    p2hId = json['p2h_id'];
    p2hKetersediaan = json['p2h_ketersediaan'];
    p2hKondisi = json['p2h_kondisi'];
    p2hKeterangan = json['p2h_keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['p2h_id_bukti_temuan'] = p2hIdBuktiTemuan;
    data['p2h_id_detail'] = p2hIdDetail;
    data['p2h_uniqid'] = p2hUniqid;
    data['p2h_foto_temuan'] = p2hFotoTemuan;
    data['p2h_keterangan_perbaikan'] = p2hKeteranganPerbaikan;
    data['p2h_status'] = p2hStatus;
    data['idPemeriksaan'] = idPemeriksaan;
    data['diperiksa'] = diperiksa;
    data['flagPemeriksaan'] = flagPemeriksaan;
    data['userInput'] = userInput;
    data['timeInput'] = timeInput;
    data['p2h_id'] = p2hId;
    data['p2h_ketersediaan'] = p2hKetersediaan;
    data['p2h_kondisi'] = p2hKondisi;
    data['p2h_keterangan'] = p2hKeterangan;
    return data;
  }
}
