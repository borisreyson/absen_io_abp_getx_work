// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:face_id_plus/app/data/models/last_absen_model.dart';

import 'package:http/http.dart' as http;

class AbsenTigaHariModel {
  int? id;
  String? id_roster;
  String? nik;
  String? tanggal;
  String? jam;
  String? gambar;
  String? status;
  String? face_id;
  int? flag;
  String? lupa_absen;
  String? time_in;
  String? tanggal_jam;
  AbsenTigaHariModel(
      {this.id,
      this.nik,
      this.tanggal,
      this.jam,
      this.gambar,
      this.status,
      this.face_id,
      this.flag,
      this.lupa_absen,
      this.time_in,
      this.tanggal_jam});
  factory AbsenTigaHariModel.fromJson(Map<String, dynamic> object) {
    return AbsenTigaHariModel(
      id: object['id'],
      nik: object['nik'],
      tanggal: object['tanggal'],
      jam: object['jam'],
      gambar: object['gambar'],
      status: object['status'],
      face_id: object['nik'],
      flag: object['flag'],
      lupa_absen: object['lupa_absen'],
      time_in: object['time_in'],
      tanggal_jam: object['tanggal_jam'],
    );
  }
  static Future<Presensi> apiAbsenTigaHari(String? nik) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/presensi/get/list?nik=$nik";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return Presensi.fromJson(jsonObject);
  }

  static Future<List<AbsenTigaHariModel>> apiAbsenTigaHariOffline(
      String nik) async {
    String apiUrl = "http://10.10.3.13/absen/get/AbsenTigaHari?nik=$nik";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var absensi = (jsonObject['AbsenTigaHari'] as List)
        .map((e) => AbsenTigaHariModel.fromJson(e))
        .toList();
    return absensi;
  }
}
