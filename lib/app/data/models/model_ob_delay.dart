class ApiObDelay {
  bool? success;
  MonitoringObDelay? monitoringObDelay;

  ApiObDelay({this.success, this.monitoringObDelay});
    factory ApiObDelay.fromJson(Map<String,dynamic> object) {
    return ApiObDelay(
      success: object["success"], 
      monitoringObDelay: (object["monitoring_obDelay"] != null) ? MonitoringObDelay.fromJson(object["monitoring_obDelay"]) : null 
    );
  }
}

class MonitoringObDelay {
  int? currentPage;
  List<DataObDelay>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MonitoringObDelay(
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

  factory MonitoringObDelay.fromJson(Map<String, dynamic> objek) {
    return MonitoringObDelay(
      currentPage: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataObDelay.fromJson(b)).toList() : [],
      from: objek["from"],
      lastPage: objek["last_page"],
      path: objek["path"],
      nextPageUrl: objek["next_page_url"],
      perPage: objek["per_page"],
      to: objek["to"],
      total: objek["total"],
      prevPageUrl: objek["prev_page_url"],
    );
  }
}

class DataObDelay {
  int? no;
  String? tgl;
  int? shift;
  String? typeDelay;
  String? delay;
  String? keterangan;
  String? userEntry;
  int? flag;

  DataObDelay(
      {this.no,
      this.tgl,
      this.shift,
      this.typeDelay,
      this.delay,
      this.keterangan,
      this.userEntry,
      this.flag});

  DataObDelay.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    tgl = json['tgl'];
    shift = json['shift'];
    typeDelay = json['type_delay'];
    delay = json['delay'];
    keterangan = json['keterangan'];
    userEntry = json['user_entry'];
    flag = json['flag'];
  }
}

class ApiOBtest {
  bool? success;
  List<DataObDelay>? ob;

  ApiOBtest({this.success, this.ob});
    factory ApiOBtest.fromJson(Map<String,dynamic> object) {
    return ApiOBtest(
      success: object["success"], 
      ob: (object["monitoring_ob"] as List).map((s) => DataObDelay.fromJson(s)).toList()
    );
  }
}
