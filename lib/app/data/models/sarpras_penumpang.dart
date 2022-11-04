class SarprasPenumpang {
  List<Penumpang>? penumpang;

  SarprasPenumpang({this.penumpang});

  SarprasPenumpang.fromJson(Map<String, dynamic> json) {
    if (json['penumpang'] != null) {
      penumpang = <Penumpang>[];
      json['penumpang'].forEach((v) {
        penumpang!.add(Penumpang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (penumpang != null) {
      data['penumpang'] = penumpang!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Penumpang {
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
  int? id;
  String? idDept;
  String? dept;
  int? company;
  String? timelog;

  Penumpang(
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
      this.perusahaan,
      this.id,
      this.idDept,
      this.dept,
      this.company,
      this.timelog});

  Penumpang.fromJson(Map<String, dynamic> json) {
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
    id = json['id'];
    idDept = json['id_dept'];
    dept = json['dept'];
    company = json['company'];
    timelog = json['timelog'];
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
    data['id'] = id;
    data['id_dept'] = idDept;
    data['dept'] = dept;
    data['company'] = company;
    data['timelog'] = timelog;
    return data;
  }
}
