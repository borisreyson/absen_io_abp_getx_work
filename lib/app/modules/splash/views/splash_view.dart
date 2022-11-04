import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: controller.animation.value,
          child: Card(
            elevation: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
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
      ),
    );
  }
  
}
