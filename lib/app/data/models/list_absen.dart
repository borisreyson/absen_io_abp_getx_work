import 'last_absen_model.dart';
class AbsenList {
  ListAbsen? listAbsen;
  AbsenList({this.listAbsen});
  factory AbsenList.fromJson(Map<String, dynamic> object) {
    return AbsenList(listAbsen: ListAbsen.fromJason(object['listAbsen']));
  }
  
}

class ListAbsen {
  int? currentPage;
  List<Presensi>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;
  ListAbsen(
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
  factory ListAbsen.fromJason(Map<String, dynamic> object) {
    return ListAbsen(
      currentPage: object['current_page'],
      data: (object['data'] as List).map((e) => Presensi.fromJson(e)).toList(),
      from: object['from'],
      lastPage: object['last_page'],
      nextPageUrl: object['next_page_url'],
      path: object['path'],
      perPage: object['per_page'],
      prevPageUrl: object['prev_page_url'],
      to: object['to'],
      total: object['total'],
    );
  }
}
