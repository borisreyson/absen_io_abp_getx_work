
class AuthModel {
  LoginModel? login;
  AuthModel({this.login});
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        login:
            json["login"] != null ? LoginModel.fromJson(json["login"]) : null);
  }
}

class LoginModel {
  bool? success;
  User? user;

  LoginModel({this.success, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user =
        json['user_login'] != null ? User.fromJson(json['user_login']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
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

  User(
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
      this.tokenPassword});

  User.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class LoginABP {
  String? username;
  String? password;
  LoginABP({this.username, this.password});
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
