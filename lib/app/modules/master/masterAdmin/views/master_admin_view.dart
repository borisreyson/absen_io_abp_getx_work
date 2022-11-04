import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/master_admin_controller.dart';

class MasterAdminView extends GetView<MasterAdminController> {
  const MasterAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Admin'),
        centerTitle: true,
      ),
      body: ListView(
        
      ),
    );
  }
}
