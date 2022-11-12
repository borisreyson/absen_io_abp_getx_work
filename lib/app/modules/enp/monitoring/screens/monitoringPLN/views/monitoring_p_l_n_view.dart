import 'package:face_id_plus/app/data/models/model_pln.dart';
import 'package:face_id_plus/app/data/utils/bg.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/monitoring_p_l_n_controller.dart';

class MonitoringPLNView extends GetView<MonitoringPLNController> {
  const MonitoringPLNView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 32, 72, 142),
          title: const Text('Monitoring PLN'),
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
        ),
        body: Stack(
          children: <Widget>[
            const BackgroundM(),
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
                        : listOB()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listOB() {
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
            controller.dataPLN.map((element) => content(element)).toList(),
      ),
    );
  }

  Widget content(DataPLN pln) {
    var ad = controller.f.value.format(double.parse("${pln.actualDaily}"));
    var ma = controller.f.value.format(double.parse("${pln.mtdActual}"));
    var tanggal = DateTime.parse("${pln.tgl}");
    return SizedBox(
      width: double.infinity,
      height: 150,
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Actual Daily",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ad,
                        style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "MTD Actual",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ma,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 33, 120, 36),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
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
}
