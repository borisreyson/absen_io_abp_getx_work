class PengendalianModel {
  List<Hirarki>? hirarki;

  PengendalianModel({this.hirarki});

  PengendalianModel.fromJson(Map<String, dynamic> json) {
    if (json['hirarki'] != null) {
      hirarki = <Hirarki>[];
      json['hirarki'].forEach((v) {
        hirarki!.add(Hirarki.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hirarki != null) {
      data['hirarki'] = hirarki!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hirarki {
  int? idHirarki;
  String? namaPengendalian;
  int? idKet;
  String? userInput;
  String? tglInput;
  int? flag;

  Hirarki(
      {this.idHirarki,
      this.namaPengendalian,
      this.idKet,
      this.userInput,
      this.tglInput,
      this.flag});

  Hirarki.fromJson(Map<String, dynamic> json) {
    idHirarki = json['idHirarki'];
    namaPengendalian = json['namaPengendalian'];
    idKet = json['id_ket'];
    userInput = json['userInput'];
    tglInput = json['tgl_input'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idHirarki'] = idHirarki;
    data['namaPengendalian'] = namaPengendalian;
    data['id_ket'] = idKet;
    data['userInput'] = userInput;
    data['tgl_input'] = tglInput;
    data['flag'] = flag;
    return data;
  }
}
