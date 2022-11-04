import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_list_absen_controller.dart';

class NavListAbsenView extends GetView {
  final NavListAbsenController navigasiTap;
  const NavListAbsenView({required this.navigasiTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: navigasiTap.bgColor.value,
          items: const [
            TabItem(icon: Icons.arrow_upward_rounded, title: 'Masuk'),
            TabItem(icon: Icons.arrow_downward_rounded, title: 'Pulang'),
          ],
          initialActiveIndex:
              navigasiTap.indexSelect.value, //optional, default as 0
          onTap: (int i) => navigasiTap.tapNavigasi(i),
        ));
  }
}
