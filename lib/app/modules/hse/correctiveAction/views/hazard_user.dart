import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/counter_hazard.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/corrective_action_controller.dart';

class HazardUser extends GetView {
  const HazardUser({
    Key? key,
    required this.controller,
    required this.data,
  }) : super(key: key);

  @override
  final CorrectiveActionController controller;
  final CounterHazard data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hazard Report",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await Get.toNamed(Routes.HAZARD_USER, parameters: {
                        "option": "user",
                        "disetujui": "0",
                        "judul": "Hazard Report"
                      });
                      controller.getPref();
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              (data.waiting != null) ? "${data.waiting}" : '0',
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Text(
                          "Waiting",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await Get.toNamed(Routes.HAZARD_USER, parameters: {
                        "option": "user",
                        "disetujui": "1",
                        "judul": "Hazard Report"
                      });
                      controller.getPref();
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              (data.approve != null) ? "${data.approve}" : '0',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Text(
                          "Approved",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await Get.toNamed(Routes.HAZARD_USER, parameters: {
                        "option": "user",
                        "disetujui": "2",
                        "judul": "Hazard Report"
                      });
                      controller.getPref();
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            (data.cancel != null) ? "${data.cancel}" : '0',
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "Canceled",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
