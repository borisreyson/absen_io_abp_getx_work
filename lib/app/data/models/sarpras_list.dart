class SarprasListModels {
  Sarpras? sarpras;

  SarprasListModels({this.sarpras});

  SarprasListModels.fromJson(Map<String, dynamic> json) {
    sarpras =
        json['sarpras'] != null ? Sarpras.fromJson(json['sarpras']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sarpras != null) {
      data['sarpras'] = sarpras!.toJson();
    }
    return data;
  }
}

class Sarpras {
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

  Sarpras(
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

  Sarpras.fromJson(Map<String, dynamic> json) {
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
  String? noidOut;
  String? nomor;
  String? nik;
  String? noLv;
  String? noPol;
  String? penumpangOut;
  String? keperluan;
  String? jamOut;
  String? tglOut;
  String? tglPeminjaman;
  String? driver;
  int? flag;
  String? tanggalEntry;
  String? flagNote;
  String? editAt;
  String? jamIn;
  String? tglIn;
  String? keterangan;
  String? userEntry;
  String? keteranganIn;
  String? flagAppr;
  String? flagOut;
  String? tanggalAppr;
  String? userAppr;
  int? no;
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
  String? namaLengkap;
  String? namaDriver;
  String? tglDibuat;
  Data({
    this.noidOut,
    this.nomor,
    this.nik,
    this.noLv,
    this.noPol,
    this.penumpangOut,
    this.keperluan,
    this.jamOut,
    this.tglOut,
    this.tglPeminjaman,
    this.driver,
    this.flag,
    this.tanggalEntry,
    this.flagNote,
    this.editAt,
    this.jamIn,
    this.tglIn,
    this.keterangan,
    this.userEntry,
    this.keteranganIn,
    this.flagAppr,
    this.flagOut,
    this.tanggalAppr,
    this.userAppr,
    this.no,
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
    this.namaLengkap,
    this.namaDriver,
    this.tglDibuat,
  });

  Data.fromJson(Map<String, dynamic> json) {
    noidOut = json['noid_out'];
    nomor = json['nomor'];
    nik = json['nik'];
    noLv = json['no_lv'];
    noPol = json['no_pol'];
    penumpangOut = json['penumpang_out'];
    keperluan = json['keperluan'];
    jamOut = json['jam_out'];
    tglOut = json['tgl_out'];
    tglPeminjaman = json['tgl_peminjaman'];
    driver = json['driver'];
    flag = json['flag'];
    tanggalEntry = json['tanggal_entry'];
    flagNote = json['flag_note'];
    editAt = json['edit_at'];
    jamIn = json['jam_in'];
    tglIn = json['tgl_in'];
    keterangan = json['keterangan'];
    userEntry = json['user_entry'];
    keteranganIn = json['keterangan_in'];
    flagAppr = json['flag_appr'];
    flagOut = json['flag_out'];
    tanggalAppr = json['tanggal_appr'];
    userAppr = json['user_appr'];
    no = json['no'];
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
    namaLengkap = json['nama_lengkap'];
    namaDriver = json['nama_driver'];
    tglDibuat = json['tglDibuat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noid_out'] = noidOut;
    data['nomor'] = nomor;
    data['nik'] = nik;
    data['no_lv'] = noLv;
    data['no_pol'] = noPol;
    data['penumpang_out'] = penumpangOut;
    data['keperluan'] = keperluan;
    data['jam_out'] = jamOut;
    data['tgl_out'] = tglOut;
    data['tgl_peminjaman'] = tglPeminjaman;
    data['driver'] = driver;
    data['flag'] = flag;
    data['tanggal_entry'] = tanggalEntry;
    data['flag_note'] = flagNote;
    data['edit_at'] = editAt;
    data['jam_in'] = jamIn;
    data['tgl_in'] = tglIn;
    data['keterangan'] = keterangan;
    data['user_entry'] = userEntry;
    data['keterangan_in'] = keteranganIn;
    data['flag_appr'] = flagAppr;
    data['flag_out'] = flagOut;
    data['tanggal_appr'] = tanggalAppr;
    data['user_appr'] = userAppr;
    data['no'] = no;
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
    data['nama_lengkap'] = namaLengkap;
    data['nama_driver'] = namaDriver;
    data['tglDibuat'] = tglDibuat;

    return data;
  }
}
