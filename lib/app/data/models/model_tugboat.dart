class ApiTugboat {
  bool? success;
  MonitoringTugboat? monitoringTugboat;

  ApiTugboat({this.success, this.monitoringTugboat});
    factory ApiTugboat.fromJson(Map<String,dynamic> object) {
    return ApiTugboat(
      success: object["success"], 
      monitoringTugboat: (object["monitoring_tugboat"] != null) ? MonitoringTugboat.fromJson(object["monitoring_tugboat"]) : null 
    );
  }
}

class MonitoringTugboat {
  int? currentPage;
  List<DataTugboat>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MonitoringTugboat(
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

  factory MonitoringTugboat.fromJson(Map<String, dynamic> objek) {
    return MonitoringTugboat(
      currentPage: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataTugboat.fromJson(b)).toList() : [],
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

class DataTugboat {
  int? no;
  String? tgl;
  String? tugboat;
  String? barge;
  String? timeBoard;
  String? tonase;
  String? status;
  String? userInput;
  String? timeInput;
  String? flag;
  String? xlsKey;

  DataTugboat(
      {
      this.no,
      this.tgl,
      this.tugboat,
      this.barge,
      this.timeBoard,
      this.tonase,
      this.status,
      this.userInput,
      this.timeInput,
      this.flag,
      this.xlsKey});

  DataTugboat.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    tgl = json['tgl'];
    tugboat = json['tugboat'];
    barge = json['barge'];
    timeBoard = json['time_board'];
    tonase = json['tonase'].toString();
    status = json['status'];
    userInput = json['user_input'];
    timeInput = json['time_input'];
    flag = json['flag'];
    xlsKey = json['xls_key'];
  }
}
