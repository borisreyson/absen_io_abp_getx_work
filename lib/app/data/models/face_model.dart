class FaceModel {
  bool? success = false;
  Datalogin? datalogin;
  FaceModel({this.success, this.datalogin});
  factory FaceModel.fromJson(Map<String, dynamic> object) {
    return FaceModel(
        success: object['success'],
        datalogin: (object['dataLogin'] != null)
            ? Datalogin.fromJson(object['dataLogin'])
            : null);
  }
}

class Datalogin {
  int? no;
  String? nik;
  String? nama;
  String? departemen;
  String? devisi;
  String? jabatan;
  int? flag;
  int? showAbsen;
  int? perusahaan;
  Datalogin({
    this.no,
    this.nik,
    this.nama,
    this.departemen,
    this.devisi,
    this.jabatan,
    this.flag,
    this.showAbsen,
    this.perusahaan,
  });

  factory Datalogin.fromJson(Map<String, dynamic> object) {
    return Datalogin(
      no: object['no'],
      nik: object['nik'],
      nama: object['nama'],
      departemen: object['departemen'],
      devisi: object['devisi'],
      jabatan: object['jabatan'],
      flag: object['flag'],
      showAbsen: object['show_absen'],
      perusahaan: object['perusahaan'],
    );
  }
}
