class ApiOB {
  bool? success;
  MonitoringOb? monitoringOb;

  ApiOB({this.success, this.monitoringOb});
    factory ApiOB.fromJson(Map<String,dynamic> object) {
    return ApiOB(
      success: object["success"], 
      monitoringOb: (object["monitoring_ob"] != null) ? MonitoringOb.fromJson(object["monitoring_ob"]) : null 
    );
  }
}

class MonitoringOb {
  int? currentPage;
  List<DataOB>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MonitoringOb(
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

  factory MonitoringOb.fromJson(Map<String, dynamic> objek) {
    return MonitoringOb(
      currentPage: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataOB.fromJson(b)).toList() : [],
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

class DataOB {
  String? tgl;
  String? planDaily;
  String? actualDaily;
  String? mtdPlan;
  String? mtdActual;
  String? remark;
  String? userInput;
  String? timeInput;
  String? flag;

  DataOB(
      {this.tgl,
      this.planDaily,
      this.actualDaily,
      this.mtdPlan,
      this.mtdActual,
      this.remark,
      this.userInput,
      this.timeInput,
      this.flag});

  DataOB.fromJson(Map<String, dynamic> json) {
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

class ApiOBtest {
  bool? success;
  List<DataOB>? ob;

  ApiOBtest({this.success, this.ob});
    factory ApiOBtest.fromJson(Map<String,dynamic> object) {
    return ApiOBtest(
      success: object["success"], 
      ob: (object["monitoring_ob"] as List).map((s) => DataOB.fromJson(s)).toList()
    );
  }
}
