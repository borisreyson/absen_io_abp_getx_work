import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuP2HController extends GetxController {
  final rule = RxnString(null);
  @override
  void onInit() {
    getPref();
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    rule.value = pref.getString(Constants.rule);
    print("Rule ${rule.value}");
  }
}
