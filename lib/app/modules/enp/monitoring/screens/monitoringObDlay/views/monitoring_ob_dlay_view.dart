import 'package:face_id_plus/app/data/models/model_ob_delay.dart';
import 'package:face_id_plus/app/data/utils/bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/monitoring_ob_dlay_controller.dart';

class MonitoringObDlayView extends GetView<MonitoringObDlayController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 32, 72, 142),
          title: const Text('Delay OB'),
          leading: InkWell(
            borderRadius: BorderRadius.circular(40),
            splashColor: const Color.fromARGB(255, 32, 72, 142),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onTap: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                bottomDialog(context);
              },
              icon: const Icon(Icons.date_range),
            ),
          ]
        ),
        body: Stack(
          children: <Widget>[
            BackgroundM(),
            Column(
              children: [
                // bagianTgl(context),
                Expanded(
                    child: (controller.isLoading.value)
                        ? Center(
                            child: Image.asset(
                              'assets/load.gif',
                              width: 70,
                            ),
                          )
                        : listObDelay()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listObDelay() {
    return SmartRefresher(
      enablePullUp: controller.pullUp.value,
      enablePullDown: true,
      onRefresh: controller.onRefresh,
      onLoading: controller.onUpdate,
      controller: controller.refreshController.value,
      header: const WaterDropMaterialHeader(
        backgroundColor: Color.fromARGB(255, 32, 72, 142),
      ),
      child: ListView(
        children:
            controller.dataObDelay.map((element) => contentDelay(element)).toList(),
      ),
    );
  }

  Widget contentDelay(DataObDelay obDelay) {
    var tanggal = DateTime.parse("${obDelay.tgl}");
    String? tipe;
    if (obDelay.typeDelay != null) {
      tipe = "${obDelay.typeDelay}";
    }else {
      tipe = null;
    }
    return SizedBox(
      width: double.infinity,
      height: 230,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 32, 72, 142),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      controller.fmt.value.format(tanggal),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              DataTable(
                columns: const [
                  DataColumn(label: Text("Tipe")),
                  DataColumn(label: Text("Shift")),
                  DataColumn(label: Text("Delay")),
                  DataColumn(label: Text("Keterangan"))
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text("$tipe")),
                      DataCell(Text("${obDelay.shift}")),
                      DataCell(Text("${obDelay.delay}")),
                      DataCell(Text("${obDelay.keterangan}")),
                    ],
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tglPick(String __title, _initial) {
    var ___inital = _initial;
    TextStyle _style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return StatefulBuilder(
      builder: (context, stateSet) {
        return Card(
          color: const Color.fromARGB(255, 32, 72, 142),
          elevation: 10,
          child: InkWell(
              onTap: () async {
                var selected = await _selectDate(context, ___inital!);
                if (selected != null) {
                  if (__title == "Dari") {
                    stateSet(() {
                      controller.dari = selected;
                      ___inital = selected;
                    });
                  } else if (__title == "Sampai") {
                    stateSet(() {
                      controller.sampai = selected;
                      ___inital = selected;
                    });
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      __title,
                      style: _style,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(controller.fmt.value.format(___inital!),
                        style: _style),
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget _submitWidgetDTrange(context) {
    TextStyle _style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return Card(
      color: Colors.blue,
      elevation: 10,
      child: InkWell(
          onTap: () {
            controller.page.value = 1;
            controller.dataObDelay.clear();
            controller.fetchObDelay(
              controller.page.value,
              controller.fmt.value.format(controller.dari!),
              controller.fmt.value.format(controller.sampai!),
            );
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Submit",
                  style: _style,
                ),
              ],
            ),
          )),
    );
  }

  bottomDialog(context) {
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
                      _tglPick("Dari", controller.dari),
                      const SizedBox(
                        height: 20,
                      ),
                      _tglPick("Sampai", controller.sampai),
                      const SizedBox(
                        height: 20,
                      ),
                      _submitWidgetDTrange(context)
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
  Future<DateTime?> _selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true,
        maxTime: controller.dateTime.value,
        currentTime: initDate);
  }
}
