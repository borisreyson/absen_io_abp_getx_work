class ApiBarging {
  bool? success;
  MonitoringBarging? monitoringBarging;

  ApiBarging({this.success, this.monitoringBarging});
    factory ApiBarging.fromJson(Map<String,dynamic> object) {
    return ApiBarging(
      success: object["success"], 
      monitoringBarging: (object["monitoring_barging"] != null) ? MonitoringBarging.fromJson(object["monitoring_barging"]) : null 
    );
  }
}

class MonitoringBarging {
  int? currentPage;
  List<DataBarging>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MonitoringBarging(
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

  factory MonitoringBarging.fromJson(Map<String, dynamic> objek) {
    return MonitoringBarging(
      currentPage: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataBarging.fromJson(b)).toList() : [],
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

class DataBarging {
  String? tgl;
  String? planDaily;
  String? actualDaily;
  String? mtdPlan;
  String? mtdActual;
  String? remark;
  String? userInput;
  String? timeInput;
  String? flag;

  DataBarging(
      {this.tgl,
      this.planDaily,
      this.actualDaily,
      this.mtdPlan,
      this.mtdActual,
      this.remark,
      this.userInput,
      this.timeInput,
      this.flag});

  DataBarging.fromJson(Map<String, dynamic> json) {
    tgl = json['tgl'];
    planDaily = json['plan_daily'].toString();
    actualDaily = json['actual_daily'].toString();
    mtdPlan = json['mtd_plan'].toString();
    mtdActual = json['mtd_actual'].toString();
    remark = json['remark'];
    userInput = json['user_input'];
    timeInput = json['time_input'];
    flag = json['flag'];
  }
}
