class SaranaP2h {
  P2hSarana? p2hSarana;

  SaranaP2h({this.p2hSarana});

  SaranaP2h.fromJson(Map<String, dynamic> json) {
    p2hSarana = json['p2hSarana'] != null
        ? P2hSarana.fromJson(json['p2hSarana'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (p2hSarana != null) {
      data['p2hSarana'] = p2hSarana!.toJson();
    }
    return data;
  }
}

class P2hSarana {
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

  P2hSarana(
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

  P2hSarana.fromJson(Map<String, dynamic> json) {
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
  int? p2hId;
  String? p2hUniqid;
  int? p2hIdSarana;
  String? p2hNoLambung;
  String? p2hNoPol;
  String? p2hShift;
  String? p2hHmKmAwal;
  String? p2hHmKmAkhir;
  String? p2hTemuan;
  String? p2hTglAwal;
  String? p2hJamAwal;
  String? p2hTglAkhir;
  String? p2hJamAkhir;
  String? p2hKoreksi;
  int? p2hFlag;
  String? p2hUserIn;
  int? idUser;
  String? username;
  String? password;
  String? namaLengkap;
  String? email;
  String? department;
  String? section;
  String? jabatan;
  String? level;
  String? idSession;
  int? status;
  String? ttd;
  String? rule;
  String? tglentry;
  String? nik;
  int? perusahaan;
  String? photoProfile;
  String? userUpdate;
  String? tokenPassword;
  String? googleSignIn;
  int? id;
  String? idDept;
  String? dept;
  int? company;
  String? userEntry;
  String? timelog;
  int? totalTemuan;

  Data(
      {this.p2hId,
      this.p2hUniqid,
      this.p2hIdSarana,
      this.p2hNoLambung,
      this.p2hNoPol,
      this.p2hShift,
      this.p2hHmKmAwal,
      this.p2hHmKmAkhir,
      this.p2hTemuan,
      this.p2hTglAwal,
      this.p2hJamAwal,
      this.p2hTglAkhir,
      this.p2hJamAkhir,
      this.p2hKoreksi,
      this.p2hFlag,
      this.p2hUserIn,
      this.idUser,
      this.username,
      this.password,
      this.namaLengkap,
      this.email,
      this.department,
      this.section,
      this.jabatan,
      this.level,
      this.idSession,
      this.status,
      this.ttd,
      this.rule,
      this.tglentry,
      this.nik,
      this.perusahaan,
      this.photoProfile,
      this.userUpdate,
      this.tokenPassword,
      this.googleSignIn,
      this.id,
      this.idDept,
      this.dept,
      this.company,
      this.userEntry,
      this.timelog,
      this.totalTemuan});

  Data.fromJson(Map<String, dynamic> json) {
    p2hId = json['p2h_id'];
    p2hUniqid = json['p2h_uniqid'];
    p2hIdSarana = json['p2h_id_sarana'];
    p2hNoLambung = json['p2h_no_lambung'];
    p2hNoPol = json['p2h_no_pol'];
    p2hShift = json['p2h_shift'];
    p2hHmKmAwal = json['p2h_hm_km_awal'];
    p2hHmKmAkhir = json['p2h_hm_km_akhir'];
    p2hTemuan = json['p2h_temuan'];
    p2hTglAwal = json['p2h_tgl_awal'];
    p2hJamAwal = json['p2h_jam_awal'];
    p2hTglAkhir = json['p2h_tgl_akhir'];
    p2hJamAkhir = json['p2h_jam_akhir'];
    p2hKoreksi = json['p2h_koreksi'];
    p2hFlag = json['p2h_flag'];
    p2hUserIn = json['p2h_user_in'];
    idUser = json['id_user'];
    username = json['username'];
    password = json['password'];
    namaLengkap = json['nama_lengkap'];
    email = json['email'];
    department = json['department'];
    section = json['section'];
    jabatan = json['jabatan'];
    level = json['level'];
    idSession = json['id_session'];
    status = json['status'];
    ttd = json['ttd'];
    rule = json['rule'];
    tglentry = json['tglentry'];
    nik = json['nik'];
    perusahaan = json['perusahaan'];
    photoProfile = json['photo_profile'];
    userUpdate = json['user_update'];
    tokenPassword = json['token_password'];
    googleSignIn = json['googleSignIn'];
    id = json['id'];
    idDept = json['id_dept'];
    dept = json['dept'];
    company = json['company'];
    userEntry = json['user_entry'];
    timelog = json['timelog'];
    totalTemuan = json['totalTemuan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['p2h_id'] = p2hId;
    data['p2h_uniqid'] = p2hUniqid;
    data['p2h_id_sarana'] = p2hIdSarana;
    data['p2h_no_lambung'] = p2hNoLambung;
    data['p2h_no_pol'] = p2hNoPol;
    data['p2h_shift'] = p2hShift;
    data['p2h_hm_km_awal'] = p2hHmKmAwal;
    data['p2h_hm_km_akhir'] = p2hHmKmAkhir;
    data['p2h_temuan'] = p2hTemuan;
    data['p2h_tgl_awal'] = p2hTglAwal;
    data['p2h_jam_awal'] = p2hJamAwal;
    data['p2h_tgl_akhir'] = p2hTglAkhir;
    data['p2h_jam_akhir'] = p2hJamAkhir;
    data['p2h_koreksi'] = p2hKoreksi;
    data['p2h_flag'] = p2hFlag;
    data['p2h_user_in'] = p2hUserIn;
    data['id_user'] = idUser;
    data['username'] = username;
    data['password'] = password;
    data['nama_lengkap'] = namaLengkap;
    data['email'] = email;
    data['department'] = department;
    data['section'] = section;
    data['jabatan'] = jabatan;
    data['level'] = level;
    data['id_session'] = idSession;
    data['status'] = status;
    data['ttd'] = ttd;
    data['rule'] = rule;
    data['tglentry'] = tglentry;
    data['nik'] = nik;
    data['perusahaan'] = perusahaan;
    data['photo_profile'] = photoProfile;
    data['user_update'] = userUpdate;
    data['token_password'] = tokenPassword;
    data['googleSignIn'] = googleSignIn;
    data['id'] = id;
    data['id_dept'] = idDept;
    data['dept'] = dept;
    data['company'] = company;
    data['user_entry'] = userEntry;
    data['timelog'] = timelog;
    data['totalTemuan'] = totalTemuan;
    return data;
  }
}
