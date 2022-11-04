class CekLogin {
  User? user;

  CekLogin({this.user});

  CekLogin.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}

class User {
  int? no;
  String? nik;
  String? nama;
  String? departemen;
  String? devisi;
  String? jabatan;
  String? userEntry;
  String? tglEntry;
  dynamic tglUp;
  String? password;
  int? flag;
  int? showAbsen;
  String? dtUpdate;
  int? perusahaan;

  User(
      {this.no,
      this.nik,
      this.nama,
      this.departemen,
      this.devisi,
      this.jabatan,
      this.userEntry,
      this.tglEntry,
      this.tglUp,
      this.password,
      this.flag,
      this.showAbsen,
      this.dtUpdate,
      this.perusahaan});

  User.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    nik = json['nik'];
    nama = json['nama'];
    departemen = json['departemen'];
    devisi = json['devisi'];
    jabatan = json['jabatan'];
    userEntry = json['user_entry'];
    tglEntry = json['tgl_entry'];
    tglUp = json['tgl_up'];
    password = json['password'];
    flag = json['flag'];
    showAbsen = json['show_absen'];
    dtUpdate = json['dt_update'];
    perusahaan = json['perusahaan'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['no'] = no;
    data['nik'] = nik;
    data['nama'] = nama;
    data['departemen'] = departemen;
    data['devisi'] = devisi;
    data['jabatan'] = jabatan;
    data['user_entry'] = userEntry;
    data['tgl_entry'] = tglEntry;
    data['tgl_up'] = tglUp;
    data['password'] = password;
    data['flag'] = flag;
    data['show_absen'] = showAbsen;
    data['dt_update'] = dtUpdate;
    data['perusahaan'] = perusahaan;
    return data;
  }
}
