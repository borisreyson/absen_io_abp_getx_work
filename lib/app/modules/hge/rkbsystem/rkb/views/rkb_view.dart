import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:face_id_plus/app/modules/hge/views/rkb_widget_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/rkb_controller.dart';

class RkbView extends GetView<RkbController> {
  const RkbView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.indexSelect.value!=null)?Scaffold(
        bottomNavigationBar: navigasi(controller.indexSelect.value),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: (controller.status.value == "ALL")
                    ? Colors.black
                    : Colors.white),
          ),
          elevation: 0,
          backgroundColor: (controller.status.value == "Waiting")
              ? Colors.orange
              : (controller.status.value == "Approved")
                  ? Colors.green
                  : (controller.status.value == "ALL")
                      ? Colors.white
                      : Colors.red,
          title: Text(
            'Rencana Kebutuhan Barang',
            style: TextStyle(
                fontSize: 14,
                color: (controller.status.value == "ALL")
                    ? Colors.black
                    : Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  var status = await showDialogFliter();
                  if (status != null) {
                    controller.status.value = status;
                    if (kDebugMode) {
                      print("status ${controller.status.value}");
                    }
                    if (controller.listOption
                        .contains("${controller.status.value}")) {
                      controller.page.value = 1;
                      controller.data.clear();
                      controller.getRkb();
                    }
                  }
                },
                icon: Icon(Icons.filter_list_rounded,
                    color: (controller.status.value == "ALL")
                        ? Colors.black
                        : Colors.white))
          ],
        ),
        body: SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: controller.pullUp.value,
          onRefresh: controller.onRefresh,
          onLoading: controller.loadMore,
          child: ListView(
            children: controller.data
                .map((element) => RkbWidgetView(data: element))
                .toList(),
          ),
        ),
      ):const CupertinoActivityIndicator(radius: 40,),
    );
  }

  showDialogFliter() {
    return Get.defaultDialog(
      contentPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.all(0),
      title: "",
      content: Column(
        children: controller.listOption
            .map((e) => Card(
                  elevation: 10,
                  color: (e == "Waiting")
                      ? Colors.orange
                      : (e == "Approved")
                          ? Colors.green
                          : (e == "ALL")
                              ? Colors.white
                              : Colors.red,
                  child: InkWell(
                    onTap: () async {
                      Get.back(result: e);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        e,
                        style: TextStyle(
                            color: (e == "ALL") ? Colors.black : Colors.white),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget navigasi(int? indexSelect) {
    return ConvexAppBar(
      style: TabStyle.react,
      backgroundColor: controller.listColor.elementAt(indexSelect!),
      items: const [
        TabItem(icon: Icons.list_alt_outlined, title: 'ALL'),
        TabItem(icon: Icons.refresh_outlined, title: 'Waiting'),
        TabItem(icon: Icons.approval_outlined, title: 'Approved'),
        TabItem(icon: Icons.cancel_presentation, title: 'Canceled'),
        TabItem(icon: Icons.delete_forever_outlined, title: 'Closed'),
      ],
      initialActiveIndex: indexSelect, //optional, default as 0
      onTap: (int i) => controller.tapNavigasi(i),
    );
  }
}
