import 'package:face_id_plus/app/modules/hse/hazardList/views/widget_hazard_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/utils/custom_footer.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/hazard_user_controller.dart';

class HazardUserView extends GetView<HazardUserController> {
  const HazardUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: _navBar(),
        floatingActionButton: _floatingAction(),
        appBar: AppBar(
          backgroundColor:
              controller.colorList.elementAt(controller.selectedIndex.value),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                _showBottomDialog(context);
              },
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                bool res = await Get.toNamed(Routes.FORM_HAZARD);

                // bool res =
                //     await Constants().goTo(() => const FormHazard(), context);
                if (res) {
                  controller.onItemTapped(0);
                }
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
          title: const Text("Hazard Report"),
        ),
        backgroundColor:
            controller.colorList.elementAt(controller.selectedIndex.value),
        body: SmartRefresher(
          enablePullUp: controller.pullUp.value,
          enablePullDown: true,
          controller: controller.pullRefresh,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          footer: const MyCustomFooter(),
          header: WaterDropMaterialHeader(
            backgroundColor: Colors.white,
            color:
                controller.colorList.elementAt(controller.selectedIndex.value),
          ),
          child: ListView(
            children: controller.data
                .map((e) => WidgetHazardView(
                      e,
                      controller.rule.value,
                      controller.reload,
                      username: controller.username.value,
                      option: controller.option.value,
                      disetujui: controller.disetujui.value,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  _showBottomDialog(context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return Stack(
            children: [
              Card(
                margin: const EdgeInsets.only(top: 40),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      controller.tglPick("Dari", controller.dari.value),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.tglPick("Sampai", controller.sampai.value),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.submitWidgetDTrange()
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        customBorder: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                      )),
                ),
              )
            ],
          );
        });
  }

  Widget _floatingAction() {
    return SizedBox(
      width: 50,
      height: 50,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.white,
          onPressed: (() async {
            bool res = await Get.toNamed(Routes.FORM_HAZARD);
            if (res) {
              controller.onItemTapped(0);
            }
          }),
          child: Icon(
            Icons.add,
            color:
                controller.colorList.elementAt(controller.selectedIndex.value),
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _navBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(Icons.autorenew),
            label: 'Waiting',
            backgroundColor:
                controller.colorList.elementAt(controller.selectedIndex.value)),
        BottomNavigationBarItem(
            icon: const Icon(Icons.approval_outlined),
            label: 'Approved',
            backgroundColor:
                controller.colorList.elementAt(controller.selectedIndex.value)),
        BottomNavigationBarItem(
          icon: const Icon(Icons.cancel),
          label: 'Cancel',
          backgroundColor:
              controller.colorList.elementAt(controller.selectedIndex.value),
        )
      ],
      currentIndex: controller.selectedIndex.value,
      onTap: controller.onItemTapped,
    );
  }
}
