class MaskapaiPost {
  String? idMaskapai;
  String? namaMaskapai;
  String? userInMaskapai;

  MaskapaiPost({this.idMaskapai, this.namaMaskapai, this.userInMaskapai});

  factory MaskapaiPost.fromJson(Map<String, dynamic> json) {
    return MaskapaiPost(
        idMaskapai: json['idMaskapai'],
        namaMaskapai: json['namaMaskapai'],
        userInMaskapai: json['userInMaskapai']);
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['idMaskapai'] = idMaskapai;
    data['namaMaskapai'] = namaMaskapai;
    data['userInMaskapai'] = userInMaskapai;
    return data;
  }
}

class MaskapaiResponse {
  bool? success;
  MaskapaiResponse({this.success});
  factory MaskapaiResponse.fromJson(Map<String, dynamic> json) {
    return MaskapaiResponse(success: json['success']);
  }
}

class MaskapaiModelGet {
  Maskapai? maskapai;

  MaskapaiModelGet({this.maskapai});

  MaskapaiModelGet.fromJson(Map<String, dynamic> json) {
    maskapai =
        json['maskapai'] != null ? Maskapai.fromJson(json['maskapai']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (maskapai != null) {
      data['maskapai'] = maskapai!.toJson();
    }
    return data;
  }
}

class Maskapai {
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

  Maskapai(
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

  Maskapai.fromJson(Map<String, dynamic> json) {
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
  int? idMaskapai;
  String? namaMaskapai;
  String? userInMaskapai;
  String? tglInMaskapai;
  int? flagMaskapai;

  Data(
      {this.idMaskapai,
      this.namaMaskapai,
      this.userInMaskapai,
      this.tglInMaskapai,
      this.flagMaskapai});

  Data.fromJson(Map<String, dynamic> json) {
    idMaskapai = json['idMaskapai'];
    namaMaskapai = json['namaMaskapai'];
    userInMaskapai = json['userInMaskapai'];
    tglInMaskapai = json['tglInMaskapai'];
    flagMaskapai = json['flagMaskapai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMaskapai'] = idMaskapai;
    data['namaMaskapai'] = namaMaskapai;
    data['userInMaskapai'] = userInMaskapai;
    data['tglInMaskapai'] = tglInMaskapai;
    data['flagMaskapai'] = flagMaskapai;
    return data;
  }
}
