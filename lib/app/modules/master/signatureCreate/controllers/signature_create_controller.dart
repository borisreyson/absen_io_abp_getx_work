import 'dart:io';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/master/models/result_models.dart';
import 'package:face_id_plus/app/modules/master/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';

class SignatureCreateController extends GetxController {
  final userProvider = MasterProvider();
  final maxPencil = 2.0.obs;
  final sizeUpdate = RxDouble(3.0);
  final colorPencil = Colors.black.obs;
  final colorCanvas = Colors.white.obs;
  final colorPencilUpdate = Colors.black.obs;
  final colorCanvasUpdate = Colors.white.obs;
  Rx<SignatureController> signatureController = Rx(SignatureController());
  Uint8List? exportImage;
  File? foto;
  final username = RxnString(null);
  final nik = RxnString(null);
  var url = "https://abpjobsite.com/ttd/";

  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
    nik.value = pref.getString(Constants.nik);
    signatureController.value = SignatureController(
      penStrokeWidth: maxPencil.value,
      penColor: colorPencil.value,
    );
    signatureController.value.clear();
    super.onInit();
  }

  getProfileUser(username) async {
    await userProvider.getUserProfile(username).then((value) {
      var res = value.userProfile;
      if (res != null) {}
    });
  }

  Future<bool> onPressBack() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.getString(Constants.ttd) == 'null' ||
        pref.getString(Constants.ttd) == null) {
      var res = await Get.defaultDialog(
        barrierDismissible: false,
        title: "Info",
        content: Column(
          children: const [
            Text("Tanda Tangan Wajib Dibuat"),
            Text("Jika Tidak , Anda Akan Keluar Dari Aplikasi"),
          ],
        ),
        confirm: SizedBox(
          height: 20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              if (Platform.isIOS) {
                exit(0);
              } else {
                SystemNavigator.pop();
              }
            },
            child: const Text("Ya, Keluar"),
          ),
        ),
        cancel: SizedBox(
          height: 20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              Get.back(result: false);
            },
            child: const Text("Tidak"),
          ),
        ),
      );
      if (res != null) {
        return res;
      } else {
        return false;
      }
    }
    return true;
  }

  @override
  void onClose() {
    signatureController.value.dispose();
    super.onClose();
  }

  void simpanGambar() async {
    exportImage = await signatureController.value.toPngBytes();
    DateTime dt = DateTime.now();

    String filename =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${username.value}_TTD.png";

    var temp = await getTemporaryDirectory();
    foto = await File('${temp.path}/$filename').create();
    foto!.writeAsBytesSync(exportImage!);
    print("foto ${foto?.path}");
    var data = PostTtdModels();
    data.username = username.value;
    data.ttd = foto;
    await userProvider.postTTD(data).then((value) async {
      var res = value?.success;
      if (res!) {
        var pref = await SharedPreferences.getInstance();
        pref.setString(Constants.ttd, filename);
        Get.back(result: true);
      }
    });
  }
}
