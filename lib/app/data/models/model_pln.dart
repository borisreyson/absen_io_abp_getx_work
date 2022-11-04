class ApiPLN {
  bool? success;
  MonitoringPLN? monitoringPLN;

  ApiPLN({this.success, this.monitoringPLN});

  factory ApiPLN.fromJson(Map<String,dynamic> object) {
    return ApiPLN(
      success: object["success"], 
      monitoringPLN: (object["monitoring_pln"] != null) ? MonitoringPLN.fromJson(object["monitoring_pln"]) : null 
    );
  }
}

class MonitoringPLN {
  int? currentPage;
  List<DataPLN>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MonitoringPLN(
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

  factory MonitoringPLN.fromJson(Map<String, dynamic> objek) {
    return MonitoringPLN(
      currentPage: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataPLN.fromJson(b)).toList() : [],
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

class DataPLN {
  int? id;
  String? tgl;
  String? planDaily;
  String? actualDaily;
  String? mtdPlan;
  String? mtdActual;
  String? remark;
  String? userInput;
  String? timeInput;
  int? flag;

  DataPLN(
      {
      this.id,
      this.tgl,
      this.planDaily,
      this.actualDaily,
      this.mtdPlan,
      this.mtdActual,
      this.remark,
      this.userInput,
      this.timeInput,
      this.flag});

  DataPLN.fromJson(Map<String, dynamic> json) {
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
