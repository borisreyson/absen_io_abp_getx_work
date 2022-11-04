import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class MonitoringView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 72, 142),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Monitoring"),
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
      body: Column(
        children: [
          // BackgroundM(),
          title(),
          menuGrid(),
          // titleDelay(),
          // menuGridDelay(),
          titleTugboat(),
          menuTugBoat()
        ],
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        color: Colors.grey,
        height: 35,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Monitoring Produksi",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  Widget titleDelay() {
    return Container(
      color: Colors.grey,
      height: 35,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Monitoring Delay",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget titleTugboat() {
    return Container(
      color: Colors.grey,
      height: 35,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Monitoring Lainnya",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget menuGrid() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_O_B);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/ob.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "OB",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_HAULING);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/hauling.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "HAULING",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_CRUSHING);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/crushing.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "CRUSHING",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_BARGING);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/barging.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "BARGING",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_P_L_N);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/barging_pln.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "BARGING PLN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_STOCK_ROM);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/stock.png",
                        width: 78,
                        height: 78,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "STOCK ROM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_STOCK_PRODUCT);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/product_stock.png",
                        width: 66,
                        height: 66,
                      ),
                      const SizedBox(height: 5),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Column(
                          children: const [
                            Text(
                              "STOCK",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              "PRODUCT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      // const FittedBox(
                      //   fit: BoxFit.contain,
                      //   child: Text(
                      //     "PRODUCT",
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold, color: Colors.blue),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuGridDelay() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_OB_DLAY);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/ob.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "OB",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_HAULING);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/hauling.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "HAULING",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_CRUSHING);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/crushing.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "CRUSHING",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_BARGING);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/barging.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "BARGING",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuTugBoat() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_TUGBOAT);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/tugboat.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "TUGBOAT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_BARGING);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.equalizer, size: 55),
                      SizedBox(height: 5),
                      Text(
                        "STRIPPING RATIO",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.toNamed(Routes.MONITORING_BARGING);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/unit.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "UNIT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
