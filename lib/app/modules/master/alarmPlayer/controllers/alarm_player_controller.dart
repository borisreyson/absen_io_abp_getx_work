import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class AlarmPlayerController extends GetxController {
  final isPlaying = false.obs;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  playAlarm() {
  }

  playRingtone() {
    FlutterRingtonePlayer.play(
        fromAsset: "assets/alarm.mp3", volume: 0.5, asAlarm: true);
  }

  playAssets() {
    AssetsAudioPlayer.newPlayer()
        .open(Audio("assets/alarm.mp3"), autoStart: true, volume: 5);
  }
}
