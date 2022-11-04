import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/pengendalian.dart';
import '../controllers/pengendalian_controller.dart';

class PengendalianView extends GetView<PengendalianController> {
  const PengendalianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: const Text("Hirarki Pengendalian"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: (controller.isLoading.value)
              ? const Center(
                  child: CupertinoActivityIndicator(
                    radius: 40,
                    color: Colors.green,
                  ),
                )
              : (controller.detHirarki.length >= controller.idHirarki.length)
                  ? ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return widgetCard(controller.data[index], index + 1);
                      },
                    )
                  : const Center(
                      child: CupertinoActivityIndicator(
                        radius: 40,
                        color: Colors.red,
                      ),
                    )),
    );
  }

  Widget widgetCard(Hirarki e, int index) {
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
                  "${e.namaPengendalian}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.right,
                ),
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
                  children: (controller.detHirarki.isNotEmpty)
                      ? controller.detHirarki[index]
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
