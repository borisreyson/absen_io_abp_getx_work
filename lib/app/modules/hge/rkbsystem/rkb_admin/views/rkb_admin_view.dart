import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rkb_admin_controller.dart';

class RkbAdminView extends GetView<RkbAdminController> {
  const RkbAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RkbAdminView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RkbAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
