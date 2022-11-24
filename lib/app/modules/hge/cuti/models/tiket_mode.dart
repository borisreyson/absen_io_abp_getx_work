class TanggalCuti {
  String? keluarga;
  String? tglKeluarga;
  String? jenisCuti;
  String? idCuti;
  String? tglCutiDari;
  String? tglCutiSampai;
  String? tiketPesawat;
  String? berangkatDari;
  String? kembaliKe;
  String? extendCuti;
  String? cutiTahunan;
  String? tahunanDari;
  String? tahunanSampai;
  TanggalCuti({
    this.keluarga,
    this.tglKeluarga,
    this.jenisCuti,
    this.idCuti,
    this.tglCutiDari,
    this.tglCutiSampai,
    this.tiketPesawat,
    this.berangkatDari,
    this.kembaliKe,
    this.extendCuti,
    this.cutiTahunan,
    this.tahunanDari,
    this.tahunanSampai,
  });
  factory TanggalCuti.fromJson(Map<String, dynamic> json) {
    return TanggalCuti(
      keluarga: json['keluarga'],
      tglKeluarga: json['tglKeluarga'],
      jenisCuti: json['jenisCuti'],
      idCuti: json['idCuti'],
      tglCutiDari: json['tglCutiDari'],
      tglCutiSampai: json['tglCutiSampai'],
      tiketPesawat: json['tiketPesawat'],
      berangkatDari: json['berangkatDari'],
      kembaliKe: json['kembaliKe'],
      extendCuti: json['extendCuti'],
      cutiTahunan: json['cutiTahunan'],
      tahunanDari: json['tahunanDari'],
      tahunanSampai: json['tahunanSampai'],
    );
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['keluarga'] = keluarga;
    data['tglKeluarga'] = tglKeluarga;
    data['jenisCuti'] = jenisCuti;
    data['idCuti'] = idCuti;
    data['tglCutiDari'] = tglCutiDari;
    data['tglCutiSampai'] = tglCutiSampai;
    data['tiketPesawat'] = tiketPesawat;
    data['berangkatDari'] = berangkatDari;
    data['kembaliKe'] = kembaliKe;
    data['extendCuti'] = extendCuti;
    data['cutiTahunan'] = cutiTahunan;
    data['tahunanDari'] = tahunanDari;
    data['tahunanSampai'] = tahunanSampai;
    return data;
  }
}

class PengajuanTiket {
  TiketPesawat? tiketBerangkat;
  TiketPesawat? tiketKembali;
  PengajuanTiket({
    this.tiketBerangkat,
    this.tiketKembali,
  });
  factory PengajuanTiket.fromJson(Map<String, dynamic> json) {
    return PengajuanTiket(
      tiketBerangkat: json['tiketBerangkat'] != null
          ? TiketPesawat.fromJson(json['tiketBerangkat'])
          : null,
      tiketKembali: json['tiketKembali'] != null
          ? TiketPesawat.fromJson(json['tiketKembali'])
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['tiketBerangkat'] = (tiketBerangkat?.toJson());
    data['tiketKembali'] = (tiketKembali?.toJson());
    return data;
  }
}

class TiketPesawat {
  String? berangkatDari;
  String? tujuan;
  String? tglTerbang;
  String? jamTerbang;
  String? maskapai;
  TiketPesawat(
      {this.berangkatDari,
      this.tujuan,
      this.tglTerbang,
      this.jamTerbang,
      this.maskapai});
  factory TiketPesawat.fromJson(Map<String, dynamic> json) {
    return TiketPesawat(
      berangkatDari: json['berangkatDari'],
      tujuan: json['tujuan'],
      tglTerbang: json['tglTerbang'],
      jamTerbang: json['jamTerbang'],
      maskapai: json['maskapai'],
    );
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['berangkatDari'] = berangkatDari;
    data['tujuan'] = tujuan;
    data['tglTerbang'] = tglTerbang;
    data['jamTerbang'] = jamTerbang;
    data['maskapai'] = maskapai;
    return data;
  }
}
