class RosterCutiKaryawan {
  RosterKaryawan? rosterKaryawan;

  RosterCutiKaryawan({this.rosterKaryawan});

  RosterCutiKaryawan.fromJson(Map<String, dynamic> json) {
    rosterKaryawan = json['rosterKaryawan'] != null
        ? RosterKaryawan.fromJson(json['rosterKaryawan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rosterKaryawan != null) {
      data['rosterKaryawan'] = rosterKaryawan!.toJson();
    }
    return data;
  }
}

class RosterKaryawan {
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

  RosterKaryawan(
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

  RosterKaryawan.fromJson(Map<String, dynamic> json) {
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

class Data {
  int? idCuti;
  String? nikCuti;
  String? tglMulaiCuti;
  String? tglSelesaiCuti;
  int? flagCuti;
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

  Data(
      {this.idCuti,
      this.nikCuti,
      this.tglMulaiCuti,
      this.tglSelesaiCuti,
      this.flagCuti,
      this.no,
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

  Data.fromJson(Map<String, dynamic> json) {
    idCuti = json['idCuti'];
    nikCuti = json['nikCuti'];
    tglMulaiCuti = json['tglMulaiCuti'];
    tglSelesaiCuti = json['tglSelesaiCuti'];
    flagCuti = json['flagCuti'];
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
    data['idCuti'] = idCuti;
    data['nikCuti'] = nikCuti;
    data['tglMulaiCuti'] = tglMulaiCuti;
    data['tglSelesaiCuti'] = tglSelesaiCuti;
    data['flagCuti'] = flagCuti;
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
