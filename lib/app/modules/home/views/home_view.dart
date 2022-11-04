import 'package:face_id_plus/app/controllers/navigasi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../views/views/navigasi_view.dart';
import '../controllers/home_controller.dart';
import 'buletin_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final navigasiTap = Get.find<NavigasiController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Buletin",
          style: TextStyle(color: Color(0xFF732937)),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: const BuletinView(),
      bottomNavigationBar: NavigasiView(navigasiTap: navigasiTap),
    );
  }
}
