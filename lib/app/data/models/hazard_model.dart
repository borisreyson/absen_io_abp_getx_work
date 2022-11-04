import 'dart:io';
import 'data_hazard.dart';

class HazardModel {
  int? currentPage;
  List<Data>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  HazardModel(
      {this.currentPage,
      this.data,
      this.from,
      this.lastPage,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  HazardModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    from = json['from'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['from'] = from;
    data['last_page'] = lastPage;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class HazardVerify {
  int? option;
  String? uid;
  String? username;
  String? keterangan;
  bool? success = false;
  bool? login = false;
  String? resultlog;

  HazardVerify({this.success, this.login, this.resultlog});

  factory HazardVerify.fromJson(Map<String, dynamic> object) {
    return HazardVerify(success: object["success"], login: object["login"]);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['option'] = option;
    data['uid'] = uid;
    data['username'] = username;
    data['keterangan'] = keterangan;
    return data;
  }
}

class HazardUpdate {
  File? fileToUpload;
  String? uid;
  String? tglSelesai;
  String? jamSelesai;
  String? idKemungkinanSesudah;
  String? idKeparahanSesudah;
  String? keterangan;

  HazardUpdate(
      {this.fileToUpload,
      this.uid,
      this.tglSelesai,
      this.jamSelesai,
      this.idKemungkinanSesudah,
      this.idKeparahanSesudah,
      this.keterangan});

  factory HazardUpdate.fromJson(Map<String, dynamic> object) {
    return HazardUpdate(
      fileToUpload: object["fileToUpload"],
      uid: object["uid"],
      tglSelesai: object["tgl_selesai"],
      jamSelesai: object["jam_selesai"],
      idKemungkinanSesudah: object["idKemungkinanSesudah"],
      idKeparahanSesudah: object["idKeparahanSesudah"],
      keterangan: object["keterangan"],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['fileToUpload'] = fileToUpload;
    data['uid'] = uid;
    data['tgl_selesai'] = tglSelesai;
    data['jam_selesai'] = jamSelesai;
    data['idKemungkinanSesudah'] = idKemungkinanSesudah;
    data['idKeparahanSesudah'] = idKeparahanSesudah;
    data['keterangan'] = keterangan;
    return data;
  }
}

class HazardGambarBukti {
  File? buktiSebelum;
  String? uid;

  HazardGambarBukti({
    this.buktiSebelum,
    this.uid,
  });

  factory HazardGambarBukti.fromJson(Map<String, dynamic> object) {
    return HazardGambarBukti(
      buktiSebelum: object["bukti_sebelum"],
      uid: object["uid"],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['bukti_sebelum'] = buktiSebelum;
    data['uid'] = uid;
    return data;
  }
}

class HazardGambarPerbaikan {
  File? buktiSelesai;
  String? uid;

  HazardGambarPerbaikan({
    this.buktiSelesai,
    this.uid,
  });

  factory HazardGambarPerbaikan.fromJson(Map<String, dynamic> object) {
    return HazardGambarPerbaikan(
      buktiSelesai: object["bukti_selesai"],
      uid: object["uid"],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['bukti_selesai'] = buktiSelesai;
    data['uid'] = uid;
    return data;
  }
}
