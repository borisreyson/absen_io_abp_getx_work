class PemeriksaanModel {
  PagingResult? masterPemeriksaan;

  PemeriksaanModel({this.masterPemeriksaan});

  PemeriksaanModel.fromJson(Map<String, dynamic> json) {
    masterPemeriksaan = json['masterPemeriksaan'] != null
        ? PagingResult.fromJson(json['masterPemeriksaan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (masterPemeriksaan != null) {
      data['masterPemeriksaan'] = masterPemeriksaan!.toJson();
    }
    return data;
  }
}

class PagingResult {
  int? currentPage;
  List<MasterPemeriksaan>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  PagingResult(
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

  PagingResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <MasterPemeriksaan>[];
      json['data'].forEach((v) {
        data!.add(MasterPemeriksaan.fromJson(v));
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

class MasterPemeriksaan {
  int? idPemeriksaan;
  String? diperiksa;
  String? userInput;
  String? timeInput;
  int? flagPemeriksaan;
  MasterPemeriksaan(
      {this.idPemeriksaan,
      this.diperiksa,
      this.userInput,
      this.timeInput,
      this.flagPemeriksaan});

  factory MasterPemeriksaan.fromJson(Map<String, dynamic> json) {
    return MasterPemeriksaan(
      idPemeriksaan: json['idPemeriksaan'],
      diperiksa: json['diperiksa'],
      userInput: json['userInput'],
      timeInput: json['timeInput'],
      flagPemeriksaan: json['flagPemeriksaan'],
    );
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["idPemeriksaan"] = '$idPemeriksaan';
    data["diperiksa"] = diperiksa;
    data["userInput"] = userInput;
    data["timeInput"] = timeInput;
    data["flagPemeriksaan"] = '$flagPemeriksaan';
    return data;
  }
}

class PemeriksaanP2h {
  List<MasterPemeriksaan>? masterPemeriksaan;

  PemeriksaanP2h({this.masterPemeriksaan});

  PemeriksaanP2h.fromJson(Map<String, dynamic> json) {
    if (json['masterPemeriksaan'] != null) {
      masterPemeriksaan = <MasterPemeriksaan>[];
      json['masterPemeriksaan'].forEach((v) {
        masterPemeriksaan!.add(MasterPemeriksaan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (masterPemeriksaan != null) {
      data['masterPemeriksaan'] =
          masterPemeriksaan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}