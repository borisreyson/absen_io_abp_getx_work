import 'package:face_id_plus/app/modules/hge/cuti/models/tiket_mode.dart';

class FormCutiModel {
  String? nikAtasan;
  String? namaKaryawan;
  String? nikKaryawan;
  String? statusKawinKaryawan;
  String? statusKaryawan;
  String? tglMulaiBekerjaKaryawan;
  String? alamatKaryawan;
  FormCutiModel({
    this.nikAtasan,
    this.namaKaryawan,
    this.nikKaryawan,
    this.statusKawinKaryawan,
    this.statusKaryawan,
    this.tglMulaiBekerjaKaryawan,
    this.alamatKaryawan,
  });
  factory FormCutiModel.fromJson(Map<String, dynamic> json) {
    return FormCutiModel(
      nikAtasan: json['nikAtasan'],
      namaKaryawan: json['namaKaryawan'],
      nikKaryawan: json['nikKaryawan'],
      statusKawinKaryawan: json['statusKawinKaryawan'],
      statusKaryawan: json['statusKaryawan'],
      tglMulaiBekerjaKaryawan: json['tglMulaiBekerjaKaryawan'],
      alamatKaryawan: json['alamatKaryawan'],
    );
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['nikAtasan'] = nikAtasan;
    data['namaKaryawan'] = namaKaryawan;
    data['nikKaryawan'] = nikKaryawan;
    data['statusKawinKaryawan'] = statusKawinKaryawan;
    data['statusKaryawan'] = statusKaryawan;
    data['tglMulaiBekerjaKaryawan'] = tglMulaiBekerjaKaryawan;
    data['alamatKaryawan'] = alamatKaryawan;
    return data;
  }
}

class CutiPost {
  FormCutiModel? formCuti;
  TanggalCuti? tglCuti;
  PengajuanTiket? tiketCuti;
  CutiPost({this.formCuti, this.tglCuti, this.tiketCuti});

  factory CutiPost.fromJson(Map<String, dynamic> json) {
    return CutiPost(
      formCuti: (json['fromCuti'] != null) ? json['formCuti'] : null,
      tglCuti: (json['tglCuti'] != null) ? json['tglCuti'] : null,
      tiketCuti: (json['tiketCuti'] != null) ? json['tiketCuti'] : null,
    );
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    if (formCuti != String) {
      data['formCuti'] = formCuti?.toJson();
    }
    if (tglCuti != String) {
      data['tglCuti'] = tglCuti?.toJson();
    }
    if (tiketCuti != String) {
      data['tiketCuti'] = tiketCuti?.toJson();
    }
    return data;
  }
}

class ResultCuti {
  bool? success;
  ResultCuti({this.success});

  factory ResultCuti.fromJson(Map<String, dynamic> json) {
    return ResultCuti(success: json['success']);
  }
}
