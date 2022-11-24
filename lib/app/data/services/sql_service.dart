// ignore_for_file: no_leading_underscores_for_local_identifiers, duplicate_ignore

import 'package:face_id_plus/app/data/services/service.dart';
import 'package:face_id_plus/app/sqlite_db/models/data_karyawan_model.dart';
import 'package:flutter/foundation.dart';

import '../models/detail_keparahan_model.dart';
import '../models/detail_pengendalian_model.dart';
import '../models/device_update_model.dart';
import '../models/kemungkinan_model.dart';
import '../models/keparahan_model.dart';
import '../models/lokasi_model.dart';
import '../models/metrik_resiko_model.dart';
import '../models/pengendalian.dart';
import '../models/perusahaan_model.dart';
import '../models/users_model.dart';
import '../repository/repository_api.dart';

class ApiService {
  Future kemungkinanGet() async {
    // ignore: no_leading_underscores_for_local_identifiers
    await KemungkinanRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.kemungkinan != null) {
          var data = _data.kemungkinan;
          for (var e in data!) {
            var kemungkinan = Kemungkinan();
            kemungkinan.idKemungkinan = e.idKemungkinan;
            kemungkinan.kemungkinan = e.kemungkinan;
            kemungkinan.keterangan = e.keterangan;
            kemungkinan.nilai = e.nilai;
            kemungkinan.flag = e.flag;
            kemungkinan.kemungkinanUpdate = e.kemungkinanUpdate;
            var res = await KemungkinanService().save(kemungkinan);
            if (kDebugMode) {
              print("Kemungkinan $res");
            }
          }
        }
      }
    });
  }

  Future keparahanGet() async {
    await KeparahanRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.keparahan != null) {
          var data = _data.keparahan;
          for (var e in data!) {
            var keparahan = Keparahan();
            keparahan.idKeparahan = e.idKeparahan;
            keparahan.keparahan = e.keparahan;
            keparahan.nilai = e.nilai;
            keparahan.flag = e.flag;
            keparahan.keparahanUpdate = e.keparahanUpdate;
            var res = await KeparahanService().save(keparahan);
            if (kDebugMode) {
              print("Keparahan $res");
            }
          }
        }
      }
    });
  }

  Future metrikGet() async {
    await MetrikRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.metrikResiko != null) {
          var data = _data.metrikResiko;
          for (var e in data!) {
            var metrik = MetrikResiko();
            metrik.batas = e.batas;
            metrik.bgColor = e.bgColor;
            metrik.flag = e.flag;
            metrik.idResiko = e.idResiko;
            metrik.kategori = e.kategori;
            metrik.kodeBahaya = e.kodeBahaya;
            metrik.max = e.max;
            metrik.min = e.min;
            metrik.tindakan = e.tindakan;
            metrik.txtColor = e.txtColor;
            var res = await MetrikService().save(metrik);
            if (kDebugMode) {
              print("Metrik $res");
            }
          }
        }
      }
    });
  }

  Future perusahaanGet() async {
    await PerusahaanRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.company != null) {
          var data = _data.company;
          for (var e in data!) {
            var perusahaan = Company();
            perusahaan.idPerusahaan = e.idPerusahaan;
            perusahaan.namaPerusahaan = e.namaPerusahaan;
            perusahaan.flag = e.flag;
            perusahaan.timeIn = e.timeIn;
            var res = await PerusahaanService().save(perusahaan);
            if (kDebugMode) {
              print("Perusahaan $res");
            }
          }
        }
      }
    });
  }

  Future lokasiGet() async {
    await LokasiRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.lokasi != null) {
          var data = _data.lokasi;
          for (var e in data!) {
            var data = Lokasi();
            data.idLok = e.idLok;
            data.lokasi = e.lokasi;
            data.desLokasi = e.desLokasi;
            data.userInput = e.userInput;
            data.tglInput = e.tglInput;
            var res = await LokasiService().save(data);
            if (kDebugMode) {
              print("Lokasi $res");
            }
          }
        }
      }
    });
  }

  Future detKeparahanGet() async {
    await DetKeparahanRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.detKeparahan != null) {
          var data = _data.detKeparahan;
          for (var e in data!) {
            var data = DetKeparahan();
            data.idDet = e.idDet;
            data.idKeparahan = e.idKeparahan;
            data.keterangan = e.keterangan;
            data.ketInput = e.ketInput;
            data.timeInput = e.timeInput;
            var res = await DetaikKeparahanService().save(data);
            if (kDebugMode) {
              print("detKeparahan $res");
            }
          }
        }
      }
    });
  }

  Future pengendalianGet() async {
    await PengendalianRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.hirarki != null) {
          var data = _data.hirarki;
          for (var e in data!) {
            var data = Hirarki();
            data.idHirarki = e.idHirarki;
            data.idKet = e.idKet;
            data.namaPengendalian = e.namaPengendalian;
            data.userInput = e.userInput;
            data.tglInput = e.tglInput;
            data.flag = e.flag;
            var res = await PengendalianService().save(data);
            if (kDebugMode) {
              print("Pengendalian $res");
            }
          }
        }
      }
    });
  }

  Future detPengendalianGet() async {
    await DetPengendalianRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.detHirarki != null) {
          var data = _data.detHirarki;
          for (var e in data!) {
            var data = DetHirarki();
            data.idHirarki = e.idHirarki;
            data.idKet = e.idKet;
            data.keterangan = e.keterangan;
            data.ketInput = e.ketInput;
            data.timeInput = e.timeInput;
            var res = await DetailPengendalianService().save(data);
            if (kDebugMode) {
              print("Detail Pengendalian $res");
            }
          }
        }
      }
    });
  }

  Future usersGet() async {
    await UsersRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.usersList != null) {
          var data = _data.usersList;
          for (var e in data!) {
            var data = UsersList();
            data.idUser = e.idUser;
            data.username = e.username;
            data.namaLengkap = e.namaLengkap;
            data.email = e.email;
            data.department = e.department;
            data.section = e.section;
            data.level = e.level;
            data.status = e.status;
            data.ttd = e.ttd;
            data.rule = e.rule;
            data.tglentry = e.tglentry;
            data.nik = e.nik;
            data.photoProfile = e.photoProfile;
            data.userUpdate = e.userUpdate;
            data.tokenPassword = e.tokenPassword;
            data.dept = e.dept;
            data.sect = e.sect;
            data.namaPerusahaan = e.namaPerusahaan;
            var res = await UsersService().save(data);
            if (kDebugMode) {
              print("Users $res");
            }
          }
        }
      }
    });
  }

  Future karyawanGet() async {
    await KaryawanRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.dataKaryawan != null) {
          var data = _data.dataKaryawan;
          for (var e in data!) {
            var data = DataKaryawan();
            data = e;
            var res = await DataKaryawanService().save(data);
            if (kDebugMode) {
              print("Karyawan $res");
            }
          }
        }
      }
    });
  }

  Future deviceUpdateGet(idDevice) async {
    await DeviceUpdateRepository().getDeviceBy(idDevice).then((_data) async {
      if (kDebugMode) {
        print("data $_data");
      }
      if (_data != null) {
        if (_data.deviceUpdate != null) {
          var data = _data.deviceUpdate;
          for (var e in data!) {
            var data = DeviceUpdate();
            data.idDevice = idDevice;
            data.idUpdate = e.idUpdate;
            data.tipe = e.tipe;
            data.timeUpdate = e.timeUpdate;
            var res = await DeviceUpdateService().save(data);
            if (kDebugMode) {
              print("deviceUpdateGet $res");
            }
          }
        }
      }
    });
  }

  Future deviceInit() async {
    await DeviceUpdateRepository().fetchAll().then((_data) async {
      if (_data != null) {
        if (_data.deviceUpdate != null) {
          var data = _data.deviceUpdate;
          for (var e in data!) {
            var data = DeviceUpdate();
            data.idUpdate = e.idUpdate;
            data.idDevice = e.idDevice;
            data.tipe = e.tipe;
            data.timeUpdate = e.timeUpdate;
            var res = await DeviceUpdateService().save(data);
            if (kDebugMode) {
              print("Users $res");
            }
          }
        }
      }
    });
  }
}
