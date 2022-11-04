import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:alarmplayer/alarmplayer.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class AlarmPlayerController extends GetxController {
  Alarmplayer alarmplayer = Alarmplayer();
  final isPlaying = false.obs;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    alarmplayer.StopAlarm();
    super.onClose();
  }

  playAlarm() {
    alarmplayer.Alarm(
      url: "assets/alarm.mp3", // Path of sound file.
      volume: 0.5, // optional, set the volume, default 1.
    );
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
