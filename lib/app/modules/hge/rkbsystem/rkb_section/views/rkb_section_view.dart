import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rkb_section_controller.dart';

class RkbSectionView extends GetView<RkbSectionController> {
  const RkbSectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RkbSectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RkbSectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
