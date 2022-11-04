import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bukti_dilokasi_controller.dart';

class BuktiDilokasiView extends GetView<BuktiDilokasiController> {
  const BuktiDilokasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuktiDilokasiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BuktiDilokasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
