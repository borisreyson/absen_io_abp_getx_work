class ApiStock {
  bool? success;
  MonitoringStock? monitoringStock;

  ApiStock({this.success, this.monitoringStock});

  factory ApiStock.fromJson(Map<String,dynamic> object) {
    return ApiStock(
      success: object["success"], 
      monitoringStock: (object["monitoring_stock"] != null) ? MonitoringStock.fromJson(object["monitoring_stock"]) : null 
    );
  }
}

class MonitoringStock {
  int? currentPage;
  List<DataStock>? data;
  int? from;
  int? lastPage;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MonitoringStock(
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

  factory MonitoringStock.fromJson(Map<String, dynamic> objek) {
    return MonitoringStock(
      currentPage: objek["current_page"],
      data:(objek['data'] != null) ? (objek["data"] as List).map((b) => DataStock.fromJson(b)).toList() : [],
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

class DataStock {
  String? tgl;
  String? dlDailyActual;
  String? dlMtdActual;
  String? stockRom;
  String? stockProduct;
  String? remark;
  String? userInput;
  String? timeInput;
  String? flag;

  DataStock(
      {this.tgl,
      this.dlDailyActual,
      this.dlMtdActual,
      this.stockRom,
      this.stockProduct,
      this.remark,
      this.userInput,
      this.timeInput,
      this.flag});

  DataStock.fromJson(Map<String, dynamic> json) {
    tgl = json['tgl'];
    dlDailyActual = json['dl_daily_actual'].toString();
    dlMtdActual = json['dl_mtd_actual'].toString();
    stockRom = json['stock_rom'].toString();
    stockProduct = json['stock_product'].toString();
    remark = json['remark'];
    userInput = json['user_input'];
    timeInput = json['time_input'];
    flag = json['flag'];
  }
}
