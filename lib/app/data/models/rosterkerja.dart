class ApiRoster {
  List<Roster>? roster;

  ApiRoster({required this.roster});

  factory ApiRoster.fromJson(Map<String, dynamic> object) {
    return ApiRoster(
        roster:
            (object["roster"] as List).map((b) => Roster.fromJson(b)).toList());
  }
}

class Roster {
  int? idRoster;
  int? subBagian;
  String? nik;
  int? tahun;
  String? bulan;
  String? tanggal;
  String? jamKerja;
  int? flag;
  String? userEntry;
  String? timeInput;
  int? idKode;
  String? kodeJam;
  String? deskripsi;
  int? idJamKerja;
  String? background;
  String? tulisan;
  String? createAt;
  String? updateAt;
  int? no;
  String? masuk;
  String? pulang;

  Roster(
      {this.idRoster,
      this.subBagian,
      this.nik,
      this.tahun,
      this.bulan,
      this.tanggal,
      this.jamKerja,
      this.flag,
      this.userEntry,
      this.timeInput,
      this.idKode,
      this.kodeJam,
      this.deskripsi,
      this.idJamKerja,
      this.background,
      this.tulisan,
      this.createAt,
      this.updateAt,
      this.no,
      this.masuk,
      this.pulang});

  factory Roster.fromJson(Map<String, dynamic> json) {
    return Roster(
      idRoster: json['id_roster'],
      subBagian: json['sub_bagian'],
      nik: json['nik'],
      tahun: json['tahun'],
      bulan: json['bulan'],
      tanggal: json['tanggal'],
      jamKerja: json['jam_kerja'],
      flag: json['flag'],
      userEntry: json['user_entry'],
      timeInput: json['time_input'],
      idKode: json['id_kode'],
      kodeJam: json['kode_jam'],
      deskripsi: json['deskripsi'],
      idJamKerja: json['id_jam_kerja'],
      background: json['background'],
      tulisan: json['tulisan'],
      createAt: json['create_at'],
      updateAt: json['update_at'],
      no: json['no'],
      masuk: json['masuk'],
      pulang: json['pulang'],
    );
  }
}
