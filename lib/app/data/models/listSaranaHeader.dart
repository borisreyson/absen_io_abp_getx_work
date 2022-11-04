class ListSaranaHeader {
  UnitSarana? unitSarana;

  ListSaranaHeader({this.unitSarana});

  ListSaranaHeader.fromJson(Map<String, dynamic> json) {
    unitSarana = json['unitSarana'] != null
        ? UnitSarana.fromJson(json['unitSarana'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (unitSarana != null) {
      data['unitSarana'] = unitSarana!.toJson();
    }
    return data;
  }
}

class UnitSarana {
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

  UnitSarana(
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

  UnitSarana.fromJson(Map<String, dynamic> json) {
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
  String? noPol;
  String? merekType;
  String? jenis;
  String? model;
  String? thnPembuatan;
  String? isiSlinder;
  String? warnaKb;
  String? warnaTnkb;
  int? flag;
  String? userEntry;
  String? tanggalEntry;
  String? noLv;
  String? picLv;
  String? driver;
  String? nik;
  String? nama;
  String? departemen;
  String? devisi;
  String? jabatan;
  String? tglEntry;
  String? tglUp;
  String? password;
  int? showAbsen;
  String? dtUpdate;
  int? perusahaan;
  int? saranaId;
  int? detailId;
  String? flagHeader;
  String? flagDetail;

  Data({
    this.no,
    this.noPol,
    this.merekType,
    this.jenis,
    this.model,
    this.thnPembuatan,
    this.isiSlinder,
    this.warnaKb,
    this.warnaTnkb,
    this.flag,
    this.userEntry,
    this.tanggalEntry,
    this.noLv,
    this.picLv,
    this.driver,
    this.nik,
    this.nama,
    this.departemen,
    this.devisi,
    this.jabatan,
    this.tglEntry,
    this.tglUp,
    this.password,
    this.showAbsen,
    this.dtUpdate,
    this.perusahaan,
    this.saranaId,
    this.detailId,
    this.flagHeader,
    this.flagDetail,
  });

  Data.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    noPol = json['no_pol'];
    merekType = json['merek_type'];
    jenis = json['jenis'];
    model = json['model'];
    thnPembuatan = json['thn_pembuatan'];
    isiSlinder = json['isi_slinder'];
    warnaKb = json['warna_kb'];
    warnaTnkb = json['warna_tnkb'];
    flag = json['flag'];
    userEntry = json['user_entry'];
    tanggalEntry = json['tanggal_entry'];
    noLv = json['no_lv'];
    picLv = json['pic_lv'];
    driver = json['driver'];
    nik = json['nik'];
    nama = json['nama'];
    departemen = json['departemen'];
    devisi = json['devisi'];
    jabatan = json['jabatan'];
    tglEntry = json['tgl_entry'];
    tglUp = json['tgl_up'];
    password = json['password'];
    showAbsen = json['show_absen'];
    dtUpdate = json['dt_update'];
    perusahaan = json['perusahaan'];
    saranaId = json['saranaId'];
    detailId = json['detailId'];
    flagHeader = json['flagHeader'];
    flagDetail = json['flagDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['no_pol'] = noPol;
    data['merek_type'] = merekType;
    data['jenis'] = jenis;
    data['model'] = model;
    data['thn_pembuatan'] = thnPembuatan;
    data['isi_slinder'] = isiSlinder;
    data['warna_kb'] = warnaKb;
    data['warna_tnkb'] = warnaTnkb;
    data['flag'] = flag;
    data['user_entry'] = userEntry;
    data['tanggal_entry'] = tanggalEntry;
    data['no_lv'] = noLv;
    data['pic_lv'] = picLv;
    data['driver'] = driver;
    data['nik'] = nik;
    data['nama'] = nama;
    data['departemen'] = departemen;
    data['devisi'] = devisi;
    data['jabatan'] = jabatan;
    data['tgl_entry'] = tglEntry;
    data['tgl_up'] = tglUp;
    data['password'] = password;
    data['show_absen'] = showAbsen;
    data['dt_update'] = dtUpdate;
    data['perusahaan'] = perusahaan;
    data['saranaId'] = saranaId;
    data['detailId'] = detailId;
    data['flagHeader'] = flagHeader;
    data['flagDetail'] = flagDetail;
    return data;
  }
}
