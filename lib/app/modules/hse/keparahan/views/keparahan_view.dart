import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/models/keparahan_model.dart';
import '../controllers/keparahan_controller.dart';

class KeparahanView extends GetView<KeparahanController> {
  const KeparahanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Keparahan Resiko"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: (controller.listDetKeparahan.length >=
                controller.idKeparahan.length)
            ? ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return widgetCard(controller.data[index], index + 1);
                },
              )
            : const Center(
                child: CupertinoActivityIndicator(
                  radius: 40,
                ),
              ),
      ),
    );
  }

  Widget widgetCard(Keparahan e, int index) {
    double lebar = Get.width / 5;
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.back(result: e);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "${e.keparahan}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Nilai Resiko : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: lebar),
                    child: Text(
                      "${e.nilai}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black,
                height: 1,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Keterangan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      (controller.listDetKeparahan.isNotEmpty && index >= 0)
                          ? controller.listDetKeparahan[index]
                              .map(
                                (e) => ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 1,
                                  minLeadingWidth: 1,
                                  leading: const Text("-"),
                                  title: Text(
                                    e.keterangan!,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                          : [
                              const Center(
                                child: CupertinoActivityIndicator(),
                              )
                            ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
