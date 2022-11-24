import 'dart:io';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmPlayerController extends GetxController {
  final isPlaying = false.obs;
  final alaram1 = RxnString(null);
  final _dir = RxnString(null);
  @override
  void onInit() async {
    _dir.value ??= (await getApplicationDocumentsDirectory()).path;
    print("dir ${_dir.value}");
    var pref = await SharedPreferences.getInstance();
    alaram1.value = pref.getString(Constants.musik1);
    print("alaram1 ${alaram1.value}");
    super.onInit();
  }

  playAlarm() {}

  playRingtone() async {
    var file = File("${alaram1.value}");

    FlutterRingtonePlayer.play(
        fromAsset: file.path, volume: 0.5, asAlarm: true);
  }

  playAssets() {
  }

  alaramLokal() async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        directory = await getExternalStorageDirectory();
        print(directory?.path);
        String newPath = "";
        List<String>? folders = directory?.path.split("/");
        for (int x = 1; x < folders!.length; x++) {
          String folder = folders[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }
        newPath = "$newPath/AbpEnergy/Musik";
        directory = Directory(newPath);
      } else {
        directory = await getTemporaryDirectory();
      }
    } catch (e) {}
  }
}
