class DetailSaranaModel {
  DetailSarana? detailSarana;

  DetailSaranaModel({this.detailSarana});

  DetailSaranaModel.fromJson(Map<String, dynamic> json) {
    detailSarana = json['detailSarana'] != null
        ? DetailSarana.fromJson(json['detailSarana'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detailSarana != null) {
      data['detailSarana'] = detailSarana!.toJson();
    }
    return data;
  }
}

class DetailSarana {
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
  int? id;
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

  DetailSarana(
      {this.no,
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
      this.id,
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
      this.detailId});

  DetailSarana.fromJson(Map<String, dynamic> json) {
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
    id = json['id'];
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
    data['id'] = id;
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
    return data;
  }
}
