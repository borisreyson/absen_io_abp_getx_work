class PerusahaanModel {
  List<Company>? company;

  PerusahaanModel({this.company});

  PerusahaanModel.fromJson(Map<String, dynamic> json) {
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(Company.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (company != null) {
      data['company'] = company!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  int? idPerusahaan;
  String? namaPerusahaan;
  int? flag;
  String? timeIn;

  Company({this.idPerusahaan, this.namaPerusahaan, this.flag, this.timeIn});

  Company.fromJson(Map<String, dynamic> json) {
    idPerusahaan = json['id_perusahaan'];
    namaPerusahaan = json['nama_perusahaan'];
    flag = json['flag'];
    timeIn = json['time_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_perusahaan'] = idPerusahaan;
    data['nama_perusahaan'] = namaPerusahaan;
    data['flag'] = flag;
    data['time_in'] = timeIn;
    return data;
  }
}
