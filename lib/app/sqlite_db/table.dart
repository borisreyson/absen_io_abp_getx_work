import 'package:sqflite/sqlite_api.dart';
import '../data/utils/constants.dart';

class Table {
  kemungkinan(Batch db) {
    var sql =
        "CREATE TABLE ${Constants.kemungkinanTb} (idKemungkinan INTEGER, kemungkinan TEXT,keterangan TEXT,nilai INTEGER,flag INTEGER,kemungkinan_update TEXT)";
    db.execute(sql);
  }

  keparahan(Batch db) {
    var sql =
        "CREATE TABLE ${Constants.keparahanTb} (idKeparahan INTEGER, keparahan TEXT,nilai INTEGER,flag INTEGER,keparahan_update TEXT)";
    db.execute(sql);
  }

  resiko(Batch db) {
    var sql =
        "CREATE TABLE ${Constants.metrikTb} (idResiko INTEGER, kodeBahaya	 TEXT,min INTEGER,max INTEGER,flag INTEGER,kategori TEXT,tindakan TEXT,bgColor TEXT,txtColor TEXT,batas TEXT,resiko_update TEXT)";
    db.execute(sql);
  }

  perusahaan(Batch db) {
    var sql =
        "CREATE TABLE ${Constants.perusahaanTb} (id_perusahaan INTEGER, nama_perusahaan	 TEXT,flag INTEGER,time_in TEXT)";
    db.execute(sql);
  }

  lokasi(Batch db) {
    var sql =
        "CREATE TABLE ${Constants.lokasiTb} (idLok INTEGER, lokasi TEXT, des_lokasi TEXT, userInput TEXT, tgl_input TEXT)";
    db.execute(sql);
  }

  detKeparahan(Batch db) {
    var sql =
        "CREATE TABLE ${Constants.detKeparahanTb} (id_det INTEGER, idKeparahan INTEGER, keterangan TEXT, ket_input TEXT, time_input  TEXT)";
    db.execute(sql);
  }

  pengendalian(Batch db) {
    var sql =
        "CREATE TABLE ${Constants.pengendalianTb} (idHirarki INTEGER, id_ket INTEGER, namaPengendalian TEXT, userInput TEXT,  tgl_input TEXT, flag INTEGER)";
    db.execute(sql);
  }

  detPengendalian(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.detPengendalianTb} 
              (id_hirarki INTEGER, 
              id_ket INTEGER, 
              keterangan TEXT, 
              ket_input  TEXT, 
              time_input TEXT)
              """;
    db.execute(sql);
  }

  users(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.usersTb} 
              (id_user INTEGER, 
              username TEXT, 
              nama_lengkap  TEXT, 
              email  TEXT, 
              department  TEXT, 
              password  TEXT, 
              section  TEXT, 
              id_session  TEXT, 
              status  INTEGER, 
              ttd  TEXT, 
              rule  TEXT, 
              level  TEXT, 
              tglentry  TEXT, 
              nik  TEXT, 
              perusahaan  INTEGER,
              photo_profile  TEXT,
              user_update  TEXT,
              token_password  TEXT,
              dept  TEXT,
              sect  TEXT,
              nama_perusahaan TEXT)
              """;
    db.execute(sql);
  }

  deviceUpdate(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.deviceUpdatTb} 
              (idUpdate INTEGER, 
              idDevice TEXT, 
              tipe  TEXT,
              timeUpdate  TEXT)
              """;
    db.execute(sql);
  }

  dataKaryawanCuti(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.karyawanCutiTb} 
              (idCuti INTEGER, 
              nama TEXT, 
              status_keluarga  TEXT,
              nik  TEXT,
              tgl_bekerja  TEXT,
              alamat  TEXT,
              status_penerimaan  TEXT,
              keluarga  TEXT,
              tgl_keluarga  TEXT)
              """;
    db.execute(sql);
  }

  dataCuti(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.cutiTb} 
              (idCuti INTEGER, 
              cuti_lapangan_dari TEXT, 
              cuti_lapangan_sampai  TEXT,
              cuti_tahunan_dari  TEXT,
              cuti_tahunan_sampai  TEXT,
              seminar_training_dari  TEXT,
              seminar_training_sampai  TEXT,
              cuti_istirahat_dari  TEXT,
              cuti_istirahat_sampai  TEXT,
              cuti_besar_dari  TEXT,
              cuti_besar_sampai  TEXT,
              kompensasi  TEXT,
              berangkat  TEXT,
              kembali  TEXT)
              """;
    db.execute(sql);
  }

  pesanTiketCuti(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.pesanTiketCutiTb} 
              (idCuti INTEGER, 
              nama TEXT, 
              berangkat  TEXT,
              tujuan  TEXT,
              tanggal_terbang  TEXT,
              jam  TEXT,
              maskapai  TEXT,
              tgl_lahir  TEXT,
              no_hp  TEXT)
              """;
    db.execute(sql);
  }

  p2hHeader(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.p2hHeader} 
              (idHeader INTEGER, 
              no_pol TEXT, 
              no_lv  TEXT,
              shift  TEXT,
              hm_km_awal  TEXT,
              hm_km_akhir  TEXT,
              user_input  TEXT,
              tgl_input  TEXT,
              jam_input  TEXT
              )
              """;
    db.execute(sql);
  }

  p2hDetail(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.p2hDetail} 
              (idDetail INTEGER, 
              idHeader INTEGER, 
              pemeriksaaan TEXT, 
              ketersediaan  TEXT,
              kondisi  TEXT,
              keterangan  TEXT)
              """;
    db.execute(sql);
  }

  p2hPemeriksaan(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.p2hPemeriksaan} 
              (idPemeriksaan INTEGER PRIMARY KEY AUTOINCREMENT, 
              idHeader INTEGER, 
              idDetail INTEGER, 
              pemeriksaaan TEXT, 
              ketersediaan  TEXT,
              kondisi TEXT,
              keterangan  TEXT,
              gambar TEXT)
              """;
    db.execute(sql);
  }

  p2hTemuan(Batch db) {
    var sql = """
              CREATE TABLE ${Constants.p2hTemuan} 
              (idPemeriksaan INTEGER PRIMARY KEY AUTOINCREMENT, 
              idHeader INTEGER, 
              idDetail INTEGER, 
              idTemuan INTEGER, 
              pemeriksaaan TEXT, 
              ketersediaan  TEXT,
              kondisi  TEXT,
              keterangan  TEXT,
              gambar TEXT)
              """;
    db.execute(sql);
  }
}
