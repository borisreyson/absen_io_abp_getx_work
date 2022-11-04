import '../models/all_hazard_model.dart';
import '../models/counter_hazard.dart';
import '../models/detail_keparahan_model.dart';
import '../models/detail_pengendalian_model.dart';
import '../models/device_update_model.dart';
import '../models/hazard_post.dart';
import '../models/hazard_user.dart';
import '../models/kemungkinan_model.dart';
import '../models/keparahan_model.dart';
import '../models/lokasi_model.dart';
import '../models/metrik_resiko_model.dart';
import '../models/pengendalian.dart';
import '../models/perusahaan_model.dart';
import '../models/user_profile.dart';
import '../models/users_model.dart';
import '../providers/provider.dart';
import '../models/berita.dart' as berita;
import '../models/data_hazard.dart' as data_hazard;

class KemungkinanRepository {
  final _provider = KemungkinanProvider();
  Future<KemungkinanResiko?> fetchAll() async {
    return await _provider.getKemungkinan();
  }
}

class KeparahanRepository {
  final _provider = KeparahanProvider();
  Future<KeparahanResiko?> fetchAll() async {
    return await _provider.getKeparahan();
  }
}

class MetrikRepository {
  final _provider = MertikResikoProvider();
  Future<MetrikModel?> fetchAll() async {
    return await _provider.getMetrik();
  }
}

class PerusahaanRepository {
  final _provider = PerusahaanProvider();
  Future<PerusahaanModel?> fetchAll() async {
    return await _provider.getPerusahaan();
  }
}

class LokasiRepository {
  final _provider = LokasiProvider();
  Future<LokasiModel?> fetchAll() async {
    return await _provider.getLokasi();
  }
}

class DetKeparahanRepository {
  final _provider = DetKeparahanProvider();
  Future<DetailKeparahanModel?> fetchAll() async {
    return await _provider.getDetKeparahan();
  }
}

class PengendalianRepository {
  final _provider = PengendalianProvider();
  Future<PengendalianModel?> fetchAll() async {
    return await _provider.getPengendalian();
  }
}

class DetPengendalianRepository {
  final _provider = DetPengendalianProvider();
  Future<DetPengendalianModel?> fetchAll() async {
    return await _provider.getDetPengendalian();
  }
}

class UsersRepository {
  final _provider = UsersProvider();
  Future<UsersModel?> fetchAll() async {
    return await _provider.getUsers();
  }

  Future<UserProfileModel?> fetchUserProfile(username) async {
    return await _provider.getUsersProfile(username);
  }
}

class HazardPostRepository {
  final _provider = HazardProvider();
  Future<ResultHazardPost?> postHazard(data, idDevice) async {
    return await _provider.postHazard(data, idDevice);
  }

  Future<ResultHazardPost?> postHazardSelesai(data, idDevice) async {
    return await _provider.postHazardSelesai(data, idDevice);
  }

  Future<ResultHazardPost?> postUpdateHazard(data, idDevice) async {
    return await _provider.postUpdateHazard(data, idDevice);
  }
}

class HazardRepository {
  final _provider = HazardProvider();
  Future<AllHazard?> getAllHazard(
      int disetujui, int page, String dari, String sampai) async {
    return await _provider.getAllHazard(disetujui, page, dari, sampai);
  }

  Future<CounterHazard?> counterHazard(username, nik) async {
    return await _provider.counterHazard(username, nik);
  }

  Future<HazardUser?> getHazardUser(
      username, disetujui, page, dari, sampai) async {
    return await _provider.getHazardUser(
        username, disetujui, page, dari, sampai);
  }

  Future<HazardUser?> getHazardKeSaya(
      nik, disetujui, page, dari, sampai) async {
    return await _provider.getHazardKeSaya(nik, disetujui, page, dari, sampai);
  }

  Future<data_hazard.Data?> getHazardDetail(uid) async {
    return await _provider.getHazardDetail(uid);
  }

  Future<ResultHazardPost?> postGambarBukti(data, idDevice) async {
    return await _provider.postGambarBukti(data, idDevice);
  }

  Future<ResultHazardPost?> postGambarPerbaikan(data, idDevice) async {
    return await _provider.postGambarPerbaikan(data, idDevice);
  }

  Future<ResultHazardPost?> postUpdateDeskripsi(uid, tipe, deskripsi) async {
    return await _provider.postUpdateDeskripsi(uid, tipe, deskripsi);
  }

  Future<ResultHazardPost?> postUpdateResiko(uid, tipe, idResiko) async {
    return await _provider.postUpdateResiko(uid, tipe, idResiko);
  }

  Future<ResultHazardPost?> postUpdatePengendalian(uid, idPengendalian) async {
    return await _provider.postUpdatePengendalian(uid, idPengendalian);
  }

  Future<ResultHazardPost?> postUpdateKatBahaya(uid, katBahaya) async {
    return await _provider.postUpdateKatBahaya(uid, katBahaya);
  }
}

class BeritaRepository {
  final _provider = BeritaProvider();
  Future<berita.BeritaModel?> getBuletin(page) async {
    return await _provider.getBuletin(page);
  }
}

class AllHazardRepository {
  final _provider = AllHazardProvider();
  Future<AllHazard?> fetchAllHazard(
      int disetujui, int page, String dari, String sampai) async {
    return _provider.getAllHazard(disetujui, page, dari, sampai);
  }
}

class DeviceUpdateRepository {
  final _provider = DeviceUpdateProvider();
  Future<DeviceUpdateModel?> fetchAll() async {
    return await _provider.getDevice();
  }

  Future<DeviceUpdateModel?> getDeviceBy(idDevice) async {
    return await _provider.getDeviceBy(idDevice);
  }
}
