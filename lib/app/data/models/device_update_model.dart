import 'dart:io';

class DeviceUpdateModel {
  List<DeviceUpdate>? deviceUpdate;

  DeviceUpdateModel({this.deviceUpdate});

  DeviceUpdateModel.fromJson(Map<String, dynamic> json) {
    if (json['deviceUpdate'] != null) {
      deviceUpdate = <DeviceUpdate>[];
      json['deviceUpdate'].forEach((v) {
        deviceUpdate?.add(DeviceUpdate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (deviceUpdate != null) {
      data['deviceUpdate'] = deviceUpdate?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeviceUpdate {
  int? idUpdate;
  String? idDevice;
  String? tipe;
  String? timeUpdate;

  DeviceUpdate({this.idUpdate, this.idDevice, this.tipe, this.timeUpdate});

  DeviceUpdate.fromJson(Map<String, dynamic> json) {
    idUpdate = json['idUpdate'];
    idDevice = json['idDevice'];
    tipe = json['tipe'];
    timeUpdate = json['timeUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idUpdate'] = idUpdate;
    data['idDevice'] = idDevice;
    data['tipe'] = tipe;
    data['timeUpdate'] = timeUpdate;
    return data;
  }
}

class DeviceUpdateResult {
  dynamic success;
  DeviceUpdateResult({this.success});
  factory DeviceUpdateResult.fromJson(Map<String, dynamic> json) {
    return DeviceUpdateResult(success: json['success']);
  }
}

class PostAbsen {
  String? nik;
  String? lat;
  String? lng;
  String? status;
  File? fileToUpload;
  PostAbsen({this.nik, this.lat, this.lng, this.fileToUpload});
  PostAbsen.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    lat = json['lat'];
    lng = json['lng'];
    status = json['status'];
    fileToUpload = json['fileToUpload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nik'] = nik;
    data['lat'] = lat;
    data['lng'] = lng;
    data['status'] = status;
    data['fileToUpload'] = fileToUpload;
    return data;
  }
}

class StatusAbsensi {
  bool absensi = false;
  StatusAbsensi({required this.absensi});
  factory StatusAbsensi.fromJson(Map<String, dynamic> json) {
    return StatusAbsensi(absensi: json['absensi']);
  }
}
