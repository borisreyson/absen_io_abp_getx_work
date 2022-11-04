class UserProfileModel {
  DataUser? dataUser;
  int? dataHazard;
  int? datInspeksi;

  UserProfileModel({this.dataUser, this.dataHazard, this.datInspeksi});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    dataUser = json['dataUser'] != null
        ? DataUser.fromJson(json['dataUser'])
        : null;
    dataHazard = json['dataHazard'];
    datInspeksi = json['datInspeksi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataUser != null) {
      data['dataUser'] = dataUser!.toJson();
    }
    data['dataHazard'] = dataHazard;
    data['datInspeksi'] = datInspeksi;
    return data;
  }
}

class DataUser {
  int? idUser;
  String? username;
  String? password;
  String? namaLengkap;
  String? email;
  String? department;
  String? section;
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
  int? id;
  String? idDept;
  String? dept;
  int? company;
  String? userEntry;
  String? timelog;
  int? inc;
  String? idSect;
  String? sect;
  int? idPerusahaan;
  String? namaPerusahaan;
  int? flag;
  String? timeIn;

  DataUser(
      {this.idUser,
      this.username,
      this.password,
      this.namaLengkap,
      this.email,
      this.department,
      this.section,
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
      this.id,
      this.idDept,
      this.dept,
      this.company,
      this.userEntry,
      this.timelog,
      this.inc,
      this.idSect,
      this.sect,
      this.idPerusahaan,
      this.namaPerusahaan,
      this.flag,
      this.timeIn});

  DataUser.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    username = json['username'];
    password = json['password'];
    namaLengkap = json['nama_lengkap'];
    email = json['email'];
    department = json['department'];
    section = json['section'];
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
    id = json['id'];
    idDept = json['id_dept'];
    dept = json['dept'];
    company = json['company'];
    userEntry = json['user_entry'];
    timelog = json['timelog'];
    inc = json['inc'];
    idSect = json['id_sect'];
    sect = json['sect'];
    idPerusahaan = json['id_perusahaan'];
    namaPerusahaan = json['nama_perusahaan'];
    flag = json['flag'];
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
    data['id'] = id;
    data['id_dept'] = idDept;
    data['dept'] = dept;
    data['company'] = company;
    data['user_entry'] = userEntry;
    data['timelog'] = timelog;
    data['inc'] = inc;
    data['id_sect'] = idSect;
    data['sect'] = sect;
    data['id_perusahaan'] = idPerusahaan;
    data['nama_perusahaan'] = namaPerusahaan;
    data['flag'] = flag;
    data['time_in'] = timeIn;
    return data;
  }
}
