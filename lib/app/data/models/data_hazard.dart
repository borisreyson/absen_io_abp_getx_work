class Data {
  int? idHazard;
  String? uid;
  String? perusahaan;
  String? tglHazard;
  String? jamHazard;
  int? idKemungkinan;
  int? idKeparahan;
  String? deskripsi;
  String? lokasi;
  String? lokasiDetail;
  String? statusPerbaikan;
  String? userInput;
  String? timeInput;
  int? status;
  String? tindakan;
  String? namaPJ;
  String? nikPJ;
  String? fotoPJ;
  String? katBahaya;
  int? idPengendalian;
  String? tglSelesai;
  String? jamSelesai;
  String? bukti;
  String? updateBukti;
  String? keteranganUpdate;
  int? idKemungkinanSesudah;
  int? idKeparahanSesudah;
  String? tglTenggat;
  int? fotoPJOption;
  int? idValidation;
  String? userValid;
  String? tglValid;
  String? jamValid;
  String? keteranganAdmin;
  int? optionFlag;
  String? lokasiHazard;
  String? namaLengkap;
  int? nilaiKemungkinan;
  int? nilaiKeparahan;
  int? idHirarki;
  String? namaPengendalian;
  String? idKet;
  String? tglInput;
  int? flag;
  int? nilaiKemungkinanSesudah;
  int? nilaiKeparahanSesudah;
  String? kemungkinan;
  String? keparahan;

  Data(
      {this.idHazard,
      this.uid,
      this.perusahaan,
      this.tglHazard,
      this.jamHazard,
      this.idKemungkinan,
      this.idKeparahan,
      this.deskripsi,
      this.lokasi,
      this.lokasiDetail,
      this.statusPerbaikan,
      this.userInput,
      this.timeInput,
      this.status,
      this.tindakan,
      this.namaPJ,
      this.nikPJ,
      this.fotoPJ,
      this.katBahaya,
      this.idPengendalian,
      this.tglSelesai,
      this.jamSelesai,
      this.bukti,
      this.updateBukti,
      this.keteranganUpdate,
      this.idKemungkinanSesudah,
      this.idKeparahanSesudah,
      this.tglTenggat,
      this.fotoPJOption,
      this.idValidation,
      this.userValid,
      this.tglValid,
      this.jamValid,
      this.keteranganAdmin,
      this.optionFlag,
      this.lokasiHazard,
      this.namaLengkap,
      this.nilaiKemungkinan,
      this.nilaiKeparahan,
      this.idHirarki,
      this.namaPengendalian,
      this.idKet,
      this.tglInput,
      this.flag,
      this.nilaiKemungkinanSesudah,
      this.nilaiKeparahanSesudah,
      this.kemungkinan,
      this.keparahan});

  Data.fromJson(Map<String, dynamic> json) {
    idHazard = json['idHazard'];
    uid = json['uid'];
    perusahaan = json['perusahaan'];
    tglHazard = json['tgl_hazard'];
    jamHazard = json['jam_hazard'];
    idKemungkinan = json['idKemungkinan'];
    idKeparahan = json['idKeparahan'];
    deskripsi = json['deskripsi'];
    lokasi = json['lokasi'];
    lokasiDetail = json['lokasi_detail'];
    statusPerbaikan = json['status_perbaikan'];
    userInput = json['user_input'];
    timeInput = json['time_input'];
    status = json['status'];
    tindakan = json['tindakan'];
    namaPJ = json['namaPJ'];
    nikPJ = json['nikPJ'];
    fotoPJ = json['fotoPJ'];
    katBahaya = json['katBahaya'];
    idPengendalian = json['idPengendalian'];
    tglSelesai = json['tgl_selesai'];
    jamSelesai = json['jam_selesai'];
    bukti = json['bukti'];
    updateBukti = json['update_bukti'];
    keteranganUpdate = json['keterangan_update'];
    idKemungkinanSesudah = json['idKemungkinanSesudah'];
    idKeparahanSesudah = json['idKeparahanSesudah'];
    tglTenggat = json['tgl_tenggat'];
    fotoPJOption = json['fotoPJ_option'];
    idValidation = json['idValidation'];
    userValid = json['user_valid'];
    tglValid = json['tgl_valid'];
    jamValid = json['jam_valid'];
    keteranganAdmin = json['keterangan_admin'];
    optionFlag = json['option_flag'];
    lokasiHazard = json['lokasiHazard'];
    namaLengkap = json['nama_lengkap'];
    nilaiKemungkinan = json['nilaiKemungkinan'];
    nilaiKeparahan = json['nilaiKeparahan'];
    idHirarki = json['idHirarki'];
    namaPengendalian = json['namaPengendalian'];
    idKet = json['id_ket'];
    tglInput = json['tgl_input'];
    flag = json['flag'];
    nilaiKemungkinanSesudah = json['nilaiKemungkinanSesudah'];
    nilaiKeparahanSesudah = json['nilaiKeparahanSesudah'];
    kemungkinan = json['kemungkinan'];
    keparahan = json['keparahan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idHazard'] = idHazard;
    data['uid'] = uid;
    data['perusahaan'] = perusahaan;
    data['tgl_hazard'] = tglHazard;
    data['jam_hazard'] = jamHazard;
    data['idKemungkinan'] = idKemungkinan;
    data['idKeparahan'] = idKeparahan;
    data['deskripsi'] = deskripsi;
    data['lokasi'] = lokasi;
    data['lokasi_detail'] = lokasiDetail;
    data['status_perbaikan'] = statusPerbaikan;
    data['user_input'] = userInput;
    data['time_input'] = timeInput;
    data['status'] = status;
    data['tindakan'] = tindakan;
    data['namaPJ'] = namaPJ;
    data['nikPJ'] = nikPJ;
    data['fotoPJ'] = fotoPJ;
    data['katBahaya'] = katBahaya;
    data['idPengendalian'] = idPengendalian;
    data['tgl_selesai'] = tglSelesai;
    data['jam_selesai'] = jamSelesai;
    data['bukti'] = bukti;
    data['update_bukti'] = updateBukti;
    data['keterangan_update'] = keteranganUpdate;
    data['idKemungkinanSesudah'] = idKemungkinanSesudah;
    data['idKeparahanSesudah'] = idKeparahanSesudah;
    data['tgl_tenggat'] = tglTenggat;
    data['fotoPJ_option'] = fotoPJOption;
    data['idValidation'] = idValidation;
    data['user_valid'] = userValid;
    data['tgl_valid'] = tglValid;
    data['jam_valid'] = jamValid;
    data['keterangan_admin'] = keteranganAdmin;
    data['option_flag'] = optionFlag;
    data['lokasiHazard'] = lokasiHazard;
    data['nama_lengkap'] = namaLengkap;
    data['nilaiKemungkinan'] = nilaiKemungkinan;
    data['nilaiKeparahan'] = nilaiKeparahan;
    data['idHirarki'] = idHirarki;
    data['namaPengendalian'] = namaPengendalian;
    data['id_ket'] = idKet;
    data['tgl_input'] = tglInput;
    data['flag'] = flag;
    data['nilaiKemungkinanSesudah'] = nilaiKemungkinanSesudah;
    data['nilaiKeparahanSesudah'] = nilaiKeparahanSesudah;
    data['kemungkinan'] = kemungkinan;
    data['keparahan'] = keparahan;
    return data;
  }
}
