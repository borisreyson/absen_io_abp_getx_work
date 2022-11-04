import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_abp_controller.dart';

class LoadingAbpView extends GetView<MenuAbpController> {
  const LoadingAbpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ScaleTransition(
        scale: controller.animationRun,
        child: Card(
          elevation: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/images/abp_60x60.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
