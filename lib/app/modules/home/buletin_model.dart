class Buletin {
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

  Buletin(
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

  Buletin.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
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
    final data = <String, dynamic>{};
    data['id_info'] = idInfo;
    data['judul'] = judul;
    data['pesan'] = pesan;
    data['tgl'] = tgl;
    data['status'] = status;
    return data;
  }
}
