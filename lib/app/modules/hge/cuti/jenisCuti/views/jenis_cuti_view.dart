import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jenis_cuti_controller.dart';

class JenisCutiView extends GetView<JenisCutiController> {
  const JenisCutiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('Jenis Cuti'),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 195, 194, 194),
        body: ListView(
          children: controller.listJenis.map((e) => cardJenis(e)).toList(),
        ));
  }

  Widget cardJenis(e) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Get.back(result: e);
        },
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Text(e),
        ),
      ),
    );
  }
}
