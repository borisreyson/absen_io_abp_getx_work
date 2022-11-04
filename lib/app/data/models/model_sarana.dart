// ignore_for_file: non_constant_identifier_names, duplicate_ignore

class ApiSarana{
  bool success = false;
  Sarana? sarana;

  ApiSarana({required this.success, required this.sarana}); 
  factory ApiSarana.fromJson(Map<String,dynamic> object) {
    return ApiSarana(
      success: object["success"], 
      sarana: (object["list_sarana"] != null) ? Sarana.fromJson(object["list_sarana"]) : null 
    );
  }
}

// ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore, duplicate_ignore
class Sarana {
  // ignore: non_constant_identifier_names
  int? current_page;
  List<DataSarana>? data;
  int? from;
  // ignore: non_constant_identifier_names
  int? last_page;
  // ignore: non_constant_identifier_names
  String? next_page_url;
  String? path;
  int? per_page;
  int? to;
  int? total;
  String? prev_page_url;

  Sarana({
    this.current_page,
    this.data,
    this.from,
    this.last_page,
    this.path,
    this.next_page_url,
    this.per_page,
    this.to,
    this.total,
    this.prev_page_url,
  });

  factory Sarana.fromJson(Map<String, dynamic> objek) {
    return Sarana(
      current_page: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataSarana.fromJson(b)).toList() : [],
      from: objek["from"],
      last_page: objek["last_page"],
      path: objek["path"],
      next_page_url: objek["next_page_url"],
      per_page: objek["per_page"],
      to: objek["to"],
      total: objek["total"],
      prev_page_url: objek["prev_page_url"],
    );
  }
}

class DataSarana {
  String? noPol;
  String? noLv;
  String? picLv;
  String? driver;
  String? flag;

  DataSarana({
    this.noPol, 
    this.noLv, 
    this.picLv, 
    this.driver, 
    this.flag});

  factory DataSarana.fromJson(Map<String, dynamic> objek){
    return DataSarana(
      noPol: objek["no_pol"], 
      noLv: objek["no_lv"], 
      picLv: objek["pic_lv"], 
      driver: objek["driver"], 
      flag: objek["flag"],
    );
  }
}