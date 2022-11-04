import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rubah_data_controller.dart';

class RubahDataView extends GetView<RubahDataController> {
  const RubahDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RubahDataView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RubahDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
