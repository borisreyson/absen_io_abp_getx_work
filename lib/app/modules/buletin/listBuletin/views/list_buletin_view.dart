import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_buletin_controller.dart';

class ListBuletinView extends GetView<ListBuletinController> {
  const ListBuletinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListBuletinView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListBuletinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
