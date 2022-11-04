class BeritaModel {
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

  BeritaModel(
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

  BeritaModel.fromJson(Map<String, dynamic> json) {
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
  int? idInfo;
  String? judul;
  String? pesan;
  String? tgl;
  int? status;

  Data({this.idInfo, this.judul, this.pesan, this.tgl, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    idInfo = json['id_info'];
    judul = json['judul'];
    pesan = json['pesan'];
    tgl = json['tgl'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_info'] = idInfo;
    data['judul'] = judul;
    data['pesan'] = pesan;
    data['tgl'] = tgl;
    data['status'] = status;
    return data;
  }
}
