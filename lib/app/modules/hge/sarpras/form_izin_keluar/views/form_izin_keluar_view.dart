import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_izin_keluar_controller.dart';

class FormIzinKeluarView extends GetView<FormIzinKeluarController> {
  const FormIzinKeluarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormIzinKeluarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FormIzinKeluarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
