class MetrikModel {
  List<MetrikResiko>? metrikResiko;

  MetrikModel({this.metrikResiko});

  MetrikModel.fromJson(Map<String, dynamic> json) {
    if (json['metrikResiko'] != null) {
      metrikResiko = <MetrikResiko>[];
      json['metrikResiko'].forEach((v) {
        metrikResiko!.add(MetrikResiko.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metrikResiko != null) {
      data['metrikResiko'] = metrikResiko!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MetrikResiko {
  int? idResiko;
  String? kodeBahaya;
  int? min;
  int? max;
  String? kategori;
  String? tindakan;
  String? bgColor;
  String? txtColor;
  int? flag;
  String? batas;
  String? resikoUpdate;

  MetrikResiko(
      {this.idResiko,
      this.kodeBahaya,
      this.min,
      this.max,
      this.kategori,
      this.tindakan,
      this.bgColor,
      this.txtColor,
      this.flag,
      this.batas,
      this.resikoUpdate});

  MetrikResiko.fromJson(Map<String, dynamic> json) {
    idResiko = json['idResiko'];
    kodeBahaya = json['kodeBahaya'];
    min = json['min'];
    max = json['max'];
    kategori = json['kategori'];
    tindakan = json['tindakan'];
    bgColor = json['bgColor'];
    txtColor = json['txtColor'];
    flag = json['flag'];
    batas = json['batas'];
    resikoUpdate = json['resiko_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idResiko'] = idResiko;
    data['kodeBahaya'] = kodeBahaya;
    data['min'] = min;
    data['max'] = max;
    data['kategori'] = kategori;
    data['tindakan'] = tindakan;
    data['bgColor'] = bgColor;
    data['txtColor'] = txtColor;
    data['flag'] = flag;
    data['batas'] = batas;
    data['resiko_update'] = resikoUpdate;
    return data;
  }
}
