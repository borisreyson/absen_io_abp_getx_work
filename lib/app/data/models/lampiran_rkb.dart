class LampiranRKBModels {
  List<Lampiran>? lampiran;

  LampiranRKBModels({this.lampiran});

  LampiranRKBModels.fromJson(Map<String, dynamic> json) {
    if (json['lampiran'] != null) {
      lampiran = <Lampiran>[];
      json['lampiran'].forEach((v) {
        lampiran!.add(Lampiran.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lampiran != null) {
      data['lampiran'] = lampiran!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lampiran {
  int? iNC;
  String? idRkb;
  String? noRkb;
  String? partName;
  String? userEntry;
  String? timelog;
  String? file;

  Lampiran(
      {this.iNC,
      this.idRkb,
      this.noRkb,
      this.partName,
      this.userEntry,
      this.timelog,
      this.file});

  Lampiran.fromJson(Map<String, dynamic> json) {
    iNC = json['INC'];
    idRkb = json['id_rkb'];
    noRkb = json['no_rkb'];
    partName = json['part_name'];
    userEntry = json['user_entry'];
    timelog = json['timelog'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['INC'] = iNC;
    data['id_rkb'] = idRkb;
    data['no_rkb'] = noRkb;
    data['part_name'] = partName;
    data['user_entry'] = userEntry;
    data['timelog'] = timelog;
    data['file'] = file;
    return data;
  }
}
