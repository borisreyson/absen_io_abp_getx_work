class SaranaModels {
  List<Sarana>? sarana;

  SaranaModels({this.sarana});

  SaranaModels.fromJson(Map<String, dynamic> json) {
    if (json['sarana'] != null) {
      sarana = <Sarana>[];
      json['sarana'].forEach((v) {
        sarana!.add(Sarana.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sarana != null) {
      data['sarana'] = sarana!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sarana {
  int? no;
  String? noPol;
  String? merekType;
  String? jenis;
  String? model;
  String? thnPembuatan;
  String? isiSlinder;
  String? warnaKb;
  String? warnaTnkb;
  String? flag;
  String? userEntry;
  String? tanggalEntry;
  String? noLv;
  String? picLv;
  String? driver;

  Sarana(
      {this.no,
      this.noPol,
      this.merekType,
      this.jenis,
      this.model,
      this.thnPembuatan,
      this.isiSlinder,
      this.warnaKb,
      this.warnaTnkb,
      this.flag,
      this.userEntry,
      this.tanggalEntry,
      this.noLv,
      this.picLv,
      this.driver});

  Sarana.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    noPol = json['no_pol'];
    merekType = json['merek_type'];
    jenis = json['jenis'];
    model = json['model'];
    thnPembuatan = json['thn_pembuatan'];
    isiSlinder = json['isi_slinder'];
    warnaKb = json['warna_kb'];
    warnaTnkb = json['warna_tnkb'];
    flag = json['flag'];
    userEntry = json['user_entry'];
    tanggalEntry = json['tanggal_entry'];
    noLv = json['no_lv'];
    picLv = json['pic_lv'];
    driver = json['driver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['no_pol'] = noPol;
    data['merek_type'] = merekType;
    data['jenis'] = jenis;
    data['model'] = model;
    data['thn_pembuatan'] = thnPembuatan;
    data['isi_slinder'] = isiSlinder;
    data['warna_kb'] = warnaKb;
    data['warna_tnkb'] = warnaTnkb;
    data['flag'] = flag;
    data['user_entry'] = userEntry;
    data['tanggal_entry'] = tanggalEntry;
    data['no_lv'] = noLv;
    data['pic_lv'] = picLv;
    data['driver'] = driver;
    return data;
  }
}

class PostIzinSarana {
  String? penumpang;
  String? driver;
  String? pemohon;
  String? noLv;
  String? keterangan;
  String? tglKeluar;
  String? jamKeluar;
  String? waktuMasuk;
  String? tglMasuk;
  String? jamMasuk;
  String? username;

  PostIzinSarana({
    this.penumpang,
    this.driver,
    this.pemohon,
    this.noLv,
    this.keterangan,
    this.tglKeluar,
    this.jamKeluar,
    this.waktuMasuk,
    this.tglMasuk,
    this.jamMasuk,
    this.username,
  });
  factory PostIzinSarana.fromJson(Map<String, dynamic> json) {
    return PostIzinSarana(
      penumpang: json['penumpang'],
      driver: json['driver'],
      pemohon: json['pemohon'],
      noLv: json['no_lv'],
      keterangan: json['keterangan'],
      tglKeluar: json['tgl_keluar'],
      jamKeluar: json['jam_keluar'],
      waktuMasuk: json['waktu_masuk'],
      tglMasuk: json['tgl_masuk'],
      jamMasuk: json['jam_masuk'],
      username: json['username'],
    );
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["penumpang"] = penumpang;
    data["driver"] = driver;
    data["pemohon"] = pemohon;
    data["no_lv"] = noLv;
    data["keterangan"] = keterangan;
    data["tgl_keluar"] = tglKeluar;
    data["jam_keluar"] = jamKeluar;
    data["waktu_masuk"] = waktuMasuk;
    data["tgl_masuk"] = tglMasuk;
    data["jam_masuk"] = jamMasuk;
    data["username"] = username;
    return data;
  }
}

class ApproveSarana {
  String? dataId;
  String? pdfURL;
  String? username;
  String? keterangan;

  ApproveSarana({
    this.dataId,
    this.pdfURL,
    this.username,
    this.keterangan,
  });
  factory ApproveSarana.fromJson(Map<String, dynamic> json) {
    return ApproveSarana(
      dataId: json['data_id'],
      pdfURL: json['pdfURL'],
      username: json['username'],
      keterangan: json['keterangan'],
    );
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["data_id"] = dataId;
    data["pdfURL"] = pdfURL;
    data["username"] = username;
    data["keterangan"] = keterangan;
    return data;
  }
}

class ResultPostSarana {
  bool? success;
  ResultPostSarana({this.success});
  factory ResultPostSarana.fromJson(Map<String, dynamic> json) {
    return ResultPostSarana(success: json['success']);
  }
}

class UpdateSecurity {
  String? noidOut;
  String? timeScan;
  UpdateSecurity({this.noidOut, this.timeScan});
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['noidOut'] = noidOut;
    data['timeScan'] = timeScan;
    return data;
  }
}
