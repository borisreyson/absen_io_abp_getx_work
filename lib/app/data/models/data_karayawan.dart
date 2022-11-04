class ListKaryawan {
  DataKaryawan? dataKaryawan;

  ListKaryawan({this.dataKaryawan});

  ListKaryawan.fromJson(Map<String, dynamic> json) {
    dataKaryawan = json['data_karyawan'] != null
        ? DataKaryawan.fromJson(json['data_karyawan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataKaryawan != null) {
      data['data_karyawan'] = dataKaryawan!.toJson();
    }
    return data;
  }
}

class DataKaryawan {
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

  DataKaryawan(
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

  DataKaryawan.fromJson(Map<String, dynamic> json) {
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
  int? inc;
  String? idSect;
  String? sect;
  int? idPerusahaan;
  String? namaPerusahaan;
  String? timeIn;

  Data(
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
      this.timelog,
      this.inc,
      this.idSect,
      this.sect,
      this.idPerusahaan,
      this.namaPerusahaan,
      this.timeIn});

  Data.fromJson(Map<String, dynamic> json) {
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
    inc = json['inc'];
    idSect = json['id_sect'];
    sect = json['sect'];
    idPerusahaan = json['id_perusahaan'];
    namaPerusahaan = json['nama_perusahaan'];
    timeIn = json['time_in'];
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
    data['inc'] = inc;
    data['id_sect'] = idSect;
    data['sect'] = sect;
    data['id_perusahaan'] = idPerusahaan;
    data['nama_perusahaan'] = namaPerusahaan;
    data['time_in'] = timeIn;
    return data;
  }
}
