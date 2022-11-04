class UsersModel {
  List<UsersList>? usersList;

  UsersModel({this.usersList});

  UsersModel.fromJson(Map<String, dynamic> json) {
    if (json['UsersList'] != null) {
      usersList = <UsersList>[];
      json['UsersList'].forEach((v) {
        usersList!.add(UsersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (usersList != null) {
      data['UsersList'] = usersList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UsersList {
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
  String? dept;
  String? sect;
  String? namaPerusahaan;

  UsersList(
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
      this.dept,
      this.sect,
      this.namaPerusahaan});

  UsersList.fromJson(Map<String, dynamic> json) {
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
    dept = json['dept'];
    sect = json['sect'];
    namaPerusahaan = json['nama_perusahaan'];
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
    data['dept'] = dept;
    data['sect'] = sect;
    data['nama_perusahaan'] = namaPerusahaan;
    return data;
  }
}
