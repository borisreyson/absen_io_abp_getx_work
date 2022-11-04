class LastAbsen {
  int? idRoster;
  String? kodeRoster;
  String? tglRoster;
  String? jamKerja;
  String? lastAbsen;
  String? lastNew;
  String? tanggal;
  String? masuk;
  String? pulang;
  Presensi? presensiMasuk;
  Presensi? presensiPulang;
  List<MapArea?>? mapArea;
  JamServer? jamServer;
  String? absensi;

  LastAbsen(
      {this.idRoster,
      this.kodeRoster,
      this.tglRoster,
      this.jamKerja,
      this.lastAbsen,
      this.lastNew,
      this.tanggal,
      this.masuk,
      this.pulang,
      this.presensiMasuk,
      this.presensiPulang,
      this.mapArea,
      this.jamServer,
      this.absensi});

  LastAbsen.fromJson(Map<String, dynamic> json) {
    idRoster = json['idRoster'];
    kodeRoster = json['kodeRoster'];
    tglRoster = json['tglRoster'];
    jamKerja = json['jamKerja'];
    lastAbsen = json['lastAbsen'];
    lastNew = json['lastNew'];
    tanggal = json['tanggal'];
    masuk = json['masuk'];
    pulang = json['pulang'];
    presensiMasuk = json['presensiMasuk'] != null
        ? Presensi?.fromJson(json['presensiMasuk'])
        : null;
    presensiPulang = json['presensiPulang'] != null
        ? Presensi?.fromJson(json['presensiPulang'])
        : null;
    if (json['mapArea'] != null) {
      mapArea = <MapArea>[];
      json['mapArea'].forEach((v) {
        mapArea!.add(MapArea.fromJson(v));
      });
    }
    jamServer = json['jam_server'] != null
        ? JamServer?.fromJson(json['jam_server'])
        : null;
    absensi = json['absensi'];
  }
}

class Presensi {
  int? id;
  int? idRoster;
  String? nik;
  String? tanggal;
  String? jam;
  String? gambar;
  String? status;
  String? faceId;
  int? flag;
  int? oFF;
  int? iZINBERBAYAR;
  int? aLPA;
  int? cR;
  int? cT;
  int? sAKIT;
  String? lupaAbsen;
  String? lat;
  String? lng;
  String? timeIn;
  String? checkin;
  String? checkout;
  String? faceIn;
  String? faceOut;
  String? tanggalJam;

  Presensi(
      {this.id,
      this.idRoster,
      this.nik,
      this.tanggal,
      this.jam,
      this.gambar,
      this.status,
      this.faceId,
      this.flag,
      this.oFF,
      this.iZINBERBAYAR,
      this.aLPA,
      this.cR,
      this.cT,
      this.sAKIT,
      this.lupaAbsen,
      this.lat,
      this.lng,
      this.timeIn,
      this.checkin,
      this.checkout,
      this.tanggalJam,
      this.faceIn,
      this.faceOut});

  Presensi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRoster = json['id_roster'];
    nik = json['nik'];
    tanggal = json['tanggal'];
    jam = json['jam'];
    gambar = json['gambar'];
    status = json['status'];
    faceId = json['face_id'];
    flag = json['flag'];
    oFF = json['OFF'];
    iZINBERBAYAR = json['IZIN_BERBAYAR'];
    aLPA = json['ALPA'];
    cR = json['CR'];
    cT = json['CT'];
    sAKIT = json['SAKIT'];
    lupaAbsen = json['lupa_absen'];
    lat = json['lat'];
    lng = json['lng'];
    timeIn = json['timeIn'];
    checkin = json['checkin'];
    checkout = json['checkout'];
    tanggalJam = json['tanggal_jam'];
    faceIn = json['faceIn'];
    faceOut = json['faceOut'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['id_roster'] = idRoster;
    data['nik'] = nik;
    data['tanggal'] = tanggal;
    data['jam'] = jam;
    data['gambar'] = gambar;
    data['status'] = status;
    data['face_id'] = faceId;
    data['flag'] = flag;
    data['OFF'] = oFF;
    data['IZIN_BERBAYAR'] = iZINBERBAYAR;
    data['ALPA'] = aLPA;
    data['CR'] = cR;
    data['CT'] = cT;
    data['SAKIT'] = sAKIT;
    data['lupa_absen'] = lupaAbsen;
    data['lat'] = lat;
    data['lng'] = lng;
    data['timeIn'] = timeIn;
    data['checkin'] = checkin;
    data['checkout'] = checkout;
    data['tanggal_jam'] = tanggalJam;
    data['faceIn'] = faceIn;
    data['faceOut'] = faceOut;
    return data;
  }
}

class JamServer {
  String? jam;
  String? menit;
  String? detik;

  JamServer({this.jam, this.menit, this.detik});

  JamServer.fromJson(Map<String, dynamic> json) {
    jam = json['jam'];
    menit = json['menit'];
    detik = json['detik'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['jam'] = jam;
    data['menit'] = menit;
    data['detik'] = detik;
    return data;
  }
}

class MapArea {
  int? idLok;
  String? company;
  double? lat;
  double? lng;
  int? flag;
  String? timeUpdate;

  MapArea(
      {this.idLok,
      this.company,
      this.lat,
      this.lng,
      this.flag,
      this.timeUpdate});

  MapArea.fromJson(Map<String, dynamic> json) {
    idLok = json['idLok'];
    company = json['company'];
    lat = json['lat'];
    lng = json['lng'];
    flag = json['flag'];
    timeUpdate = json['time_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idLok'] = idLok;
    data['company'] = company;
    data['lat'] = lat;
    data['lng'] = lng;
    data['flag'] = flag;
    data['time_update'] = timeUpdate;
    return data;
  }
}
