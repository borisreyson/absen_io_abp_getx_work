import 'dart:io';

class HazardPostModel {
  File? fileToUpload;
  File? fileToUploadPJ;
  String? perusahaan;
  String? tglHazard;
  String? jamHazard;
  String? lokasi;
  String? lokasiDetail;
  String? deskripsi;
  String? kemungkinan;
  String? keparahan;
  String? katBahaya;
  String? pengendalian;
  String? tindakan;
  String? namaPJ;
  String? nikPJ;
  String? status;
  String? tglTenggat;
  String? userInput;
  HazardPostModel(
      {this.fileToUpload,
      this.fileToUploadPJ,
      this.perusahaan,
      this.tglHazard,
      this.jamHazard,
      this.lokasi,
      this.lokasiDetail,
      this.deskripsi,
      this.kemungkinan,
      this.keparahan,
      this.katBahaya,
      this.pengendalian,
      this.tindakan,
      this.namaPJ,
      this.nikPJ,
      this.status,
      this.tglTenggat,
      this.userInput});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['fileToUpload'] = fileToUpload;
    data['fileToUploadPJ'] = fileToUploadPJ;
    data['perusahaan'] = perusahaan;
    data['tgl_hazard'] = tglHazard;
    data['jam_hazard'] = jamHazard;
    data['lokasi'] = lokasi;
    data['lokasi_detail'] = lokasiDetail;
    data['deskripsi'] = deskripsi;
    data['kemungkinan'] = kemungkinan;
    data['keparahan'] = keparahan;
    data['katBahaya'] = katBahaya;
    data['pengendalian'] = pengendalian;
    data['pengendalian'] = tindakan;
    data['namaPJ'] = namaPJ;
    data['nikPJ'] = nikPJ;
    data['status'] = status;
    data['tglTenggat'] = tglTenggat;
    data['user_input'] = userInput;
    return data;
  }
}

class HazardPostSelesaiModel {
  File? fileToUpload;
  File? fileToUploadPJ;
  File? fileToUploadSelesai;
  String? perusahaan;
  String? tglHazard;
  String? jamHazard;
  String? lokasi;
  String? lokasiDetail;
  String? deskripsi;
  String? kemungkinan;
  String? keparahan;
  String? kemungkinanSesudah;
  String? keparahanSesudah;
  String? katBahaya;
  String? pengendalian;
  String? tindakan;
  String? namaPJ;
  String? nikPJ;
  String? status;
  String? tglSelesai;
  String? jamSelesai;
  String? keteranganPJ;
  String? userInput;
  HazardPostSelesaiModel(
      {this.fileToUpload,
      this.fileToUploadPJ,
      this.fileToUploadSelesai,
      this.perusahaan,
      this.tglHazard,
      this.jamHazard,
      this.lokasi,
      this.lokasiDetail,
      this.deskripsi,
      this.kemungkinan,
      this.keparahan,
      this.kemungkinanSesudah,
      this.keparahanSesudah,
      this.katBahaya,
      this.pengendalian,
      this.tindakan,
      this.namaPJ,
      this.nikPJ,
      this.status,
      this.tglSelesai,
      this.jamSelesai,
      this.keteranganPJ,
      this.userInput});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['fileToUpload'] = fileToUpload;
    data['fileToUploadPJ'] = fileToUploadPJ;
    data['fileToUploadSelesai'] = fileToUploadSelesai;
    data['perusahaan'] = perusahaan;
    data['tgl_hazard'] = tglHazard;
    data['jam_hazard'] = jamHazard;
    data['lokasi'] = lokasi;
    data['lokasi_detail'] = lokasiDetail;
    data['deskripsi'] = deskripsi;
    data['kemungkinan'] = kemungkinan;
    data['keparahan'] = keparahan;
    data['kemungkinanSesudah'] = kemungkinanSesudah;
    data['keparahanSesudah'] = keparahanSesudah;
    data['katBahaya'] = katBahaya;
    data['pengendalian'] = pengendalian;
    data['pengendalian'] = tindakan;
    data['namaPJ'] = namaPJ;
    data['nikPJ'] = nikPJ;
    data['status'] = status;
    data['tglSelesai'] = tglSelesai;
    data['jamSelesai'] = jamSelesai;
    data['keteranganPJ'] = keteranganPJ;
    data['user_input'] = userInput;
    return data;
  }
}

class ResultHazardPost {
  bool success = false;
  ResultHazardPost({required this.success});
  factory ResultHazardPost.fromJson(Map<String, dynamic> object) {
    return ResultHazardPost(success: object['success']);
  }
}

class ResultPostFoto {
  bool success = false;
  String? fileName;
  ResultPostFoto({required this.success, this.fileName});
  factory ResultPostFoto.fromJson(Map<String, dynamic> object) {
    return ResultPostFoto(
        success: object['success'], fileName: object['fileName']);
  }
}

class PostFotoProfile {
  File? fotoProfile;
  String? username;

  PostFotoProfile({
    this.fotoProfile,
    this.username,
  });

  factory PostFotoProfile.fromJson(Map<String, dynamic> object) {
    return PostFotoProfile(
      fotoProfile: object["bukti_sebelum"],
      username: object["username"],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['fotoProfile'] = fotoProfile;
    data['username'] = username;
    return data;
  }
}
