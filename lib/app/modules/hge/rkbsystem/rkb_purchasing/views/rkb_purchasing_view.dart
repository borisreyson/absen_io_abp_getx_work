import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rkb_purchasing_controller.dart';

class RkbPurchasingView extends GetView<RkbPurchasingController> {
  const RkbPurchasingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RkbPurchasingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RkbPurchasingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
