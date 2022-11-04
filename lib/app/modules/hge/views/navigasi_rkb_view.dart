import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigasi_rkb_controller.dart';

// ignore: must_be_immutable
class NavigasiRkbView extends GetView {
  NavigasiRkbController? navTap;
  NavigasiRkbView({this.navTap, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Status Navigasi ${controller.indexSelect.value}");
    }
    return ConvexAppBar(
      style: TabStyle.react,
      backgroundColor:
          controller.listColor.elementAt(controller.indexSelect.value),
      items: const [
        TabItem(icon: Icons.newspaper, title: 'ALL'),
        TabItem(icon: Icons.newspaper, title: 'Waiting'),
        TabItem(icon: Icons.co_present_rounded, title: 'Approved'),
        TabItem(icon: Icons.apps_rounded, title: 'Canceled'),
        TabItem(icon: Icons.apps_rounded, title: 'Closed'),
      ],
      initialActiveIndex: navTap?.indexSelect.value, //optional, default as 0
      onTap: (int i) => navTap?.tapNavigasi(i),
    );
  }
}
