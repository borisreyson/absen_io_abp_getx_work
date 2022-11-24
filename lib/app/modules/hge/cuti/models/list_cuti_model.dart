class ListCutiOnlineModels {
  CutiOnline? cutiOnline;

  ListCutiOnlineModels({this.cutiOnline});

  ListCutiOnlineModels.fromJson(Map<String, dynamic> json) {
    cutiOnline = json['cutiOnline'] != null
        ? CutiOnline.fromJson(json['cutiOnline'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cutiOnline != null) {
      data['cutiOnline'] = cutiOnline!.toJson();
    }
    return data;
  }
}

class CutiOnline {
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

  CutiOnline(
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

  CutiOnline.fromJson(Map<String, dynamic> json) {
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
  String? idCutiOnline;
  String? namaCutiOnline;
  String? nikCutiOnline;
  String? statusKeluargaCutiOnline;
  String? statusKaryawanCutiOnline;
  String? tglMulaiBekerjaCutiOnline;
  String? alamatCutiOnline;
  int? membawaKeluargacutiOnline;
  String? tglMembawaKeluargaCutiOnline;
  String? atasanCutiOnline;
  String? tglPengajuanCutiOnline;
  String? jenisCutiOnline;
  String? tglMulaiCutiOnline;
  String? tglSelesaiCutiOnline;
  String? kodeCutiOnline;
  int? tiketPesawatCutiOnline;
  int? idVerifikasi;
  String? atasanVerifikasi;
  String? waktuAtasanVerifikasi;
  String? deptHeadVerifikasi;
  String? waktuDeptHeadVerifikasi;
  String? kttVerifikasi;
  String? waktuKttVerifikasi;
  String? userBatalVerifikasi;
  String? hcVerifikasi;
  String? waktuHcVerifikasi;
  String? waktuBatalVerifikasi;
  String? keteranganBatalVerifikasi;
  String? namaBatal;
  String? namaAtasan;
  String? ttdAtasan;
  String? namaDeptHead;
  String? ttdDeptHead;
  String? namaKtt;
  String? ttdKtt;
  String? namaHc;
  String? ttdHc;
  String? department;
  int? extendCutiOnline;
  String? cutiTahunanOnline;
  String? tahunanDariCutiOnline;
  String? tahunanSampaiCutiOnline;
  String? userBatalPerpanjangan;
  String? tglBatalPerpanjangan;
  String? keteranganBatalPerpanjangan;
  Data({
    this.idCutiOnline,
    this.namaCutiOnline,
    this.nikCutiOnline,
    this.statusKeluargaCutiOnline,
    this.statusKaryawanCutiOnline,
    this.tglMulaiBekerjaCutiOnline,
    this.alamatCutiOnline,
    this.membawaKeluargacutiOnline,
    this.tglMembawaKeluargaCutiOnline,
    this.atasanCutiOnline,
    this.jenisCutiOnline,
    this.tglMulaiCutiOnline,
    this.tglSelesaiCutiOnline,
    this.kodeCutiOnline,
    this.tiketPesawatCutiOnline,
    this.idVerifikasi,
    this.atasanVerifikasi,
    this.tglPengajuanCutiOnline,
    this.waktuAtasanVerifikasi,
    this.deptHeadVerifikasi,
    this.waktuDeptHeadVerifikasi,
    this.kttVerifikasi,
    this.waktuKttVerifikasi,
    this.userBatalVerifikasi,
    this.hcVerifikasi,
    this.waktuHcVerifikasi,
    this.waktuBatalVerifikasi,
    this.keteranganBatalVerifikasi,
    this.namaBatal,
    this.namaAtasan,
    this.ttdAtasan,
    this.namaDeptHead,
    this.ttdDeptHead,
    this.namaKtt,
    this.ttdKtt,
    this.namaHc,
    this.ttdHc,
    this.department,
    this.extendCutiOnline,
    this.cutiTahunanOnline,
    this.tahunanDariCutiOnline,
    this.tahunanSampaiCutiOnline,
    this.userBatalPerpanjangan,
    this.tglBatalPerpanjangan,
    this.keteranganBatalPerpanjangan,
  });

  Data.fromJson(Map<String, dynamic> json) {
    idCutiOnline = json['idCutiOnline'];
    namaCutiOnline = json['namaCutiOnline'];
    nikCutiOnline = json['nikCutiOnline'];
    statusKeluargaCutiOnline = json['statusKeluargaCutiOnline'];
    statusKaryawanCutiOnline = json['statusKaryawanCutiOnline'];
    tglMulaiBekerjaCutiOnline = json['tglMulaiBekerjaCutiOnline'];
    alamatCutiOnline = json['alamatCutiOnline'];
    membawaKeluargacutiOnline = json['membawaKeluargacutiOnline'];
    tglMembawaKeluargaCutiOnline = json['tglMembawaKeluargaCutiOnline'];
    atasanCutiOnline = json['atasanCutiOnline'];
    tglPengajuanCutiOnline = json['tglPengajuanCutiOnline'];
    jenisCutiOnline = json['jenisCutiOnline'];
    tglMulaiCutiOnline = json['tglMulaiCutiOnline'];
    tglSelesaiCutiOnline = json['tglSelesaiCutiOnline'];
    kodeCutiOnline = json['kodeCutiOnline'];
    tiketPesawatCutiOnline = json['tiketPesawatCutiOnline'];
    idVerifikasi = json['idVerifikasi'];
    atasanVerifikasi = json['atasanVerifikasi'];
    waktuAtasanVerifikasi = json['waktuAtasanVerifikasi'];
    deptHeadVerifikasi = json['deptHeadVerifikasi'];
    waktuDeptHeadVerifikasi = json['waktuDeptHeadVerifikasi'];
    kttVerifikasi = json['kttVerifikasi'];
    waktuKttVerifikasi = json['waktuKttVerifikasi'];
    userBatalVerifikasi = json['userBatalVerifikasi'];
    hcVerifikasi = json['hcVerifikasi'];
    waktuHcVerifikasi = json['waktuHcVerifikasi'];
    waktuBatalVerifikasi = json['waktuBatalVerifikasi'];
    keteranganBatalVerifikasi = json['keteranganBatalVerifikasi'];
    namaBatal = json['nama_batal'];
    namaAtasan = json['nama_atasan'];
    ttdAtasan = json['ttd_atasan'];
    namaDeptHead = json['nama_dept_head'];
    ttdDeptHead = json['ttd_dept_head'];
    namaKtt = json['nama_ktt'];
    ttdKtt = json['ttd_ktt'];
    namaHc = json['nama_hc'];
    ttdHc = json['ttd_hc'];
    department = json['department'];
    extendCutiOnline = json['extendCutiOnline'];
    cutiTahunanOnline = json['cutiTahunanOnline'];
    tahunanDariCutiOnline = json['tahunanDariCutiOnline'];
    tahunanSampaiCutiOnline = json['tahunanSampaiCutiOnline'];
    userBatalPerpanjangan = json['userBatalPerpanjangan'];
    tglBatalPerpanjangan = json['tglBatalPerpanjangan'];
    keteranganBatalPerpanjangan = json['keteranganBatalPerpanjangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idCutiOnline'] = idCutiOnline;
    data['namaCutiOnline'] = namaCutiOnline;
    data['nikCutiOnline'] = nikCutiOnline;
    data['statusKeluargaCutiOnline'] = statusKeluargaCutiOnline;
    data['statusKaryawanCutiOnline'] = statusKaryawanCutiOnline;
    data['tglMulaiBekerjaCutiOnline'] = tglMulaiBekerjaCutiOnline;
    data['alamatCutiOnline'] = alamatCutiOnline;
    data['membawaKeluargacutiOnline'] = membawaKeluargacutiOnline;
    data['tglMembawaKeluargaCutiOnline'] = tglMembawaKeluargaCutiOnline;
    data['atasanCutiOnline'] = atasanCutiOnline;
    data['tglPengajuanCutiOnline'] = tglPengajuanCutiOnline;
    data['jenisCutiOnline'] = jenisCutiOnline;
    data['tglMulaiCutiOnline'] = tglMulaiCutiOnline;
    data['tglSelesaiCutiOnline'] = tglSelesaiCutiOnline;
    data['kodeCutiOnline'] = kodeCutiOnline;
    data['tiketPesawatCutiOnline'] = tiketPesawatCutiOnline;
    data['idVerifikasi'] = idVerifikasi;
    data['atasanVerifikasi'] = atasanVerifikasi;
    data['waktuAtasanVerifikasi'] = waktuAtasanVerifikasi;
    data['deptHeadVerifikasi'] = deptHeadVerifikasi;
    data['waktuDeptHeadVerifikasi'] = waktuDeptHeadVerifikasi;
    data['kttVerifikasi'] = kttVerifikasi;
    data['waktuKttVerifikasi'] = waktuKttVerifikasi;
    data['userBatalVerifikasi'] = userBatalVerifikasi;
    data['hcVerifikasi'] = hcVerifikasi;
    data['waktuHcVerifikasi'] = waktuHcVerifikasi;
    data['waktuBatalVerifikasi'] = waktuBatalVerifikasi;
    data['keteranganBatalVerifikasi'] = keteranganBatalVerifikasi;
    data['nama_batal'] = namaBatal;
    data['nama_atasan'] = namaAtasan;
    data['ttd_atasan'] = ttdAtasan;
    data['nama_dept_head'] = namaDeptHead;
    data['ttd_dept_head'] = ttdDeptHead;
    data['nama_ktt'] = namaKtt;
    data['ttd_ktt'] = ttdKtt;
    data['nama_hc'] = namaHc;
    data['ttd_hc'] = ttdHc;
    data['department'] = department;
    data['extendCutiOnline'] = extendCutiOnline;
    data['cutiTahunanOnline'] = cutiTahunanOnline;
    data['tahunanDariCutiOnline'] = tahunanDariCutiOnline;
    data['tahunanSampaiCutiOnline'] = tahunanSampaiCutiOnline;
    data['keteranganBatalVerifikasi'] = keteranganBatalVerifikasi;
    data['userBatalPerpanjangan'] = userBatalPerpanjangan;
    data['tglBatalPerpanjangan'] = tglBatalPerpanjangan;
    data['keteranganBatalPerpanjangan'] = keteranganBatalPerpanjangan;
    return data;
  }
}

class TiketCutiModels {
  List<TiketCuti>? tiketCuti;

  TiketCutiModels({this.tiketCuti});

  TiketCutiModels.fromJson(Map<String, dynamic> json) {
    if (json['tiketCuti'] != null) {
      tiketCuti = <TiketCuti>[];
      json['tiketCuti'].forEach((v) {
        tiketCuti!.add(TiketCuti.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tiketCuti != null) {
      data['tiketCuti'] = tiketCuti!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TiketCuti {
  String? idCutiOnline;
  int? idTiketCutiOnline;
  String? jenisTiketCutiOnline;
  String? berangkatCutiOnline;
  String? tujuanCutiOnline;
  String? tglTerbangCutiOnline;
  String? jamTerbangCutiOnline;
  String? maskapaiCutiOnline;

  TiketCuti(
      {this.idCutiOnline,
      this.idTiketCutiOnline,
      this.jenisTiketCutiOnline,
      this.berangkatCutiOnline,
      this.tujuanCutiOnline,
      this.tglTerbangCutiOnline,
      this.jamTerbangCutiOnline,
      this.maskapaiCutiOnline});

  TiketCuti.fromJson(Map<String, dynamic> json) {
    idCutiOnline = json['idCutiOnline'];
    idTiketCutiOnline = json['idTiketCutiOnline'];
    jenisTiketCutiOnline = json['jenisTiketCutiOnline'];
    berangkatCutiOnline = json['berangkatCutiOnline'];
    tujuanCutiOnline = json['tujuanCutiOnline'];
    tglTerbangCutiOnline = json['tglTerbangCutiOnline'];
    jamTerbangCutiOnline = json['jamTerbangCutiOnline'];
    maskapaiCutiOnline = json['maskapaiCutiOnline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idCutiOnline'] = idCutiOnline;
    data['idTiketCutiOnline'] = idTiketCutiOnline;
    data['jenisTiketCutiOnline'] = jenisTiketCutiOnline;
    data['berangkatCutiOnline'] = berangkatCutiOnline;
    data['tujuanCutiOnline'] = tujuanCutiOnline;
    data['tglTerbangCutiOnline'] = tglTerbangCutiOnline;
    data['jamTerbangCutiOnline'] = jamTerbangCutiOnline;
    data['maskapaiCutiOnline'] = maskapaiCutiOnline;
    return data;
  }
}
