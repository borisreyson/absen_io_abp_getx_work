class ApiCrushing {
  bool? success;
  MonitoringCrushing? monitoringCrushing;

  ApiCrushing({this.success, this.monitoringCrushing});

  factory ApiCrushing.fromJson(Map<String,dynamic> object) {
    return ApiCrushing(
      success: object["success"], 
      monitoringCrushing: (object["monitoring_crushing"] != null) ? MonitoringCrushing.fromJson(object["monitoring_crushing"]) : null 
    );
  }
}

class MonitoringCrushing {
  int? currentPage;
  List<DataCrushing>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MonitoringCrushing(
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

  factory MonitoringCrushing.fromJson(Map<String, dynamic> objek) {
    return MonitoringCrushing(
      currentPage: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataCrushing.fromJson(b)).toList() : [],
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

class DataCrushing {
  String? tgl;
  String? planDaily;
  String? actualDaily;
  String? mtdPlan;
  String? mtdActual;
  String? remark;
  String? userInput;
  String? timeInput;
  String? flag;

  DataCrushing(
      {this.tgl,
      this.planDaily,
      this.actualDaily,
      this.mtdPlan,
      this.mtdActual,
      this.remark,
      this.userInput,
      this.timeInput,
      this.flag});

  DataCrushing.fromJson(Map<String, dynamic> json) {
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
