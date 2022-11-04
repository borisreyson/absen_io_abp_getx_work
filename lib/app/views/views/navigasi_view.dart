import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/navigasi_controller.dart';

class NavigasiView extends GetView {
  final NavigasiController? navigasiTap;

  const NavigasiView({this.navigasiTap, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      elevation: 0,
      style: TabStyle.react,
      backgroundColor: const Color(0xFF732937),
      items: const [
        TabItem(icon: Icons.newspaper, title: 'Buletin'),
        TabItem(icon: Icons.co_present_rounded, title: 'Absensi'),
        TabItem(icon: Icons.apps_rounded, title: 'ABP ENERGY'),
      ],
      initialActiveIndex:
          navigasiTap?.indexSelect.value, //optional, default as 0
      onTap: (int i) => navigasiTap?.tapNavigasi(i),
    );
  }
}
