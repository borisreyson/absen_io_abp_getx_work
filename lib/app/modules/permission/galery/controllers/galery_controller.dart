import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/utils/constants.dart';

class GaleryController extends GetxController {
  final galeryStatus = false.obs;
  @override
  void onInit() {
    statusIzin();
    super.onInit();
  }

  @override
  void onClose() {}

  statusIzin() async {
    var lokasi = handler.Permission.photos;
    var status = await lokasi.status;
    if (status == handler.PermissionStatus.granted) {
      galeryStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      galeryStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      galeryStatus.value = false;
    }
  }

  getPermission() async {
    var mintaIzin = await handler.Permission.photos.status;
    if (mintaIzin == handler.PermissionStatus.denied ||
        mintaIzin == handler.PermissionStatus.limited) {
      await handler.Permission.photos.request();
      statusIzin();
    } else if (mintaIzin == handler.PermissionStatus.permanentlyDenied) {
      await handler.openAppSettings();
      statusIzin();
    } else {
      statusIzin();
    }
  }

  saveIntro() async {
    var pref = await SharedPreferences.getInstance();
    await pref.setBool(Constants.intro, true);
    Get.offAllNamed(Routes.HOME);
  }
}
