import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignatureViewController extends GetxController {
  var url = "https://abpjobsite.com/ttd/";
  final imageData = RxnString(null);
  final loaded = false.obs;
  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    imageData.value = pref.getString(Constants.ttd);
    if (imageData.value == null) {
      Get.toNamed(Routes.SIGNATURE_CREATE);
    } else {
      loaded.value = true;
    }
    super.onInit();
  }
}
