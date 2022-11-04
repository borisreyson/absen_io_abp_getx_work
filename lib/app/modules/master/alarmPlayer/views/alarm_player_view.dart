import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/alarm_player_controller.dart';

class AlarmPlayerView extends GetView<AlarmPlayerController> {
  const AlarmPlayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: const Text('AlarmPlayerView'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.playAlarm();
                  },
                  child: const Text("Play Alarm")),
              ElevatedButton(
                  onPressed: () {
                    controller.playRingtone();
                  },
                  child: const Text("Play Ringtone")),
              ElevatedButton(
                  onPressed: () {
                    controller.playAssets();
                  },
                  child: const Text("Play Assets")),
              Center(
                child: Text((controller.isPlaying.value)
                    ? "Is Playing"
                    : "Not Playing"),
              ),
            ],
          )),
    );
  }
}
