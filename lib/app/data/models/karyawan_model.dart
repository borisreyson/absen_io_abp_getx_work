class KaryawanModel {
  Karyawan? karyawan;

  KaryawanModel({this.karyawan});

  KaryawanModel.fromJson(Map<String, dynamic> json) {
    karyawan =
        json['karyawan'] != null ? Karyawan.fromJson(json['karyawan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (karyawan != null) {
      data['karyawan'] = karyawan!.toJson();
    }
    return data;
  }
}

class Karyawan {
  int? no;
  String? nik;
  String? nama;
  String? departemen;
  String? devisi;
  String? jabatan;
  String? userEntry;
  String? tglEntry;
  String? tglUp;
  String? password;
  int? flag;
  int? showAbsen;
  String? dtUpdate;
  int? perusahaan;

  Karyawan(
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

  Karyawan.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
