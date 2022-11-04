import 'package:face_id_plus/app/data/models/model_stock.dart';
import 'package:face_id_plus/app/data/utils/bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/monitoring_stock_rom_controller.dart';

class MonitoringStockRomView extends GetView<MonitoringStockRomController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 32, 72, 142),
          title: const Text('Monitoring Stock ROM'),
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
          ],
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
                        : listStock()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listStock() {
    return SmartRefresher(
      enablePullUp: controller.pullUp.value,
      enablePullDown: true,
      onRefresh: controller.onRefresh,
      onLoading: controller.onUpdate,
      controller: controller.refreshController.value,
      header: const WaterDropMaterialHeader(
        backgroundColor: Color.fromARGB(255, 32, 72, 142),
      ),
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        childAspectRatio: (1 / 0.8),
        children:
            controller.dataStockRom.map((element) => contentStock(element)).toList(),
      ),
    );
  }

  Widget contentStock(DataStock h) {
    var sp = controller.f.value.format(double.parse("${h.stockRom}"));
    var tanggal = DateTime.parse("${h.tgl}");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 32, 72, 142),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
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
            const SizedBox(height: 10),
            const Text(
              "Stock Rom",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "$sp MT",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget bagianTgl(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 20,
        child: formTgl(context),
      ),
    );
  }

  Widget formTgl(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 32, 72, 142), width: 2),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 32, 72, 142), width: 2),
                  ),
                  labelText: "Dari Tanggal",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 32, 72, 142),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.green,
                  hintText: 'Tanggal'),
              controller: controller.dariTgl,
              onTap: () async {
                var tgl = await _selectDate(context, controller.tglFilter!);
                if (tgl != null) {
                  controller.dariTgl.text = controller.fmt.value.format(tgl);
                }
              },
              readOnly: true,
            ),
          ),
        ),
        const Text(
          "-",
          style: TextStyle(
            color: Color.fromARGB(255, 32, 72, 142),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 32, 72, 142), width: 2),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 32, 72, 142), width: 2),
                  ),
                  labelText: "Sampai Tanggal",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 32, 72, 142),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.green,
                  hintText: 'Tanggal'),
              controller: controller.sampaiTgl,
              onTap: () async {
                var tgl = await _selectDate(context, controller.tglFilter!);
                if (tgl != null) {
                  controller.sampaiTgl.text = controller.fmt.value.format(tgl);
                }
              },
              readOnly: true,
            ),
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 32, 72, 142),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white)),
        ),
      ],
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
            controller.dataStockRom.clear();
            controller.fetchStockRom(
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
