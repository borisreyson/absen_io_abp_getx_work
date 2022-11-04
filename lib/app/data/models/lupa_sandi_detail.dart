class LupaSandiDetail {
  DataLogin? dataLogin;

  LupaSandiDetail({this.dataLogin});

  LupaSandiDetail.fromJson(Map<String, dynamic> json) {
    dataLogin = json['dataLogin'] != null
        ? DataLogin.fromJson(json['dataLogin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataLogin != null) {
      data['dataLogin'] = dataLogin!.toJson();
    }
    return data;
  }
}

class DataLogin {
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
  int? no;
  String? nama;
  String? departemen;
  String? devisi;
  String? userEntry;
  String? tglEntry;
  String? tglUp;
  int? flag;
  int? showAbsen;
  String? dtUpdate;
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

  DataLogin(
      {this.idUser,
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
      this.no,
      this.nama,
      this.departemen,
      this.devisi,
      this.userEntry,
      this.tglEntry,
      this.tglUp,
      this.flag,
      this.showAbsen,
      this.dtUpdate,
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

  DataLogin.fromJson(Map<String, dynamic> json) {
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
    no = json['no'];
    nama = json['nama'];
    departemen = json['departemen'];
    devisi = json['devisi'];
    userEntry = json['user_entry'];
    tglEntry = json['tgl_entry'];
    tglUp = json['tgl_up'];
    flag = json['flag'];
    showAbsen = json['show_absen'];
    dtUpdate = json['dt_update'];
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
    data['no'] = no;
    data['nama'] = nama;
    data['departemen'] = departemen;
    data['devisi'] = devisi;
    data['user_entry'] = userEntry;
    data['tgl_entry'] = tglEntry;
    data['tgl_up'] = tglUp;
    data['flag'] = flag;
    data['show_absen'] = showAbsen;
    data['dt_update'] = dtUpdate;
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
