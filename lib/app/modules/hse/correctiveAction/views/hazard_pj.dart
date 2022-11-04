import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/counter_hazard.dart';
import '../../../../data/models/user_profile.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/corrective_action_controller.dart';

class HazardPJ extends GetView {
  const HazardPJ({
    Key? key,
    required this.controller,
    required this.data,
    required this.profile,
  }) : super(key: key);

  @override
  final CorrectiveActionController controller;
  final DataUser profile;
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
              "Hazard Report Ke Saya",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await Get.toNamed(Routes.HAZARD_P_J, parameters: {
                        "option": "saya",
                        "disetujui": "2",
                        "judul": "Hazard Report Ke Saya"
                      });
                      controller.getPref();
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              (data.kesayaWaiting != null)
                                  ? "${data.kesayaWaiting}"
                                  : '0',
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
                      await Get.toNamed(Routes.HAZARD_P_J, parameters: {
                        "option": "saya",
                        "disetujui": "1",
                        "judul": "Hazard Report Ke Saya"
                      });
                      controller.getPref();
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              (data.kesayaDisetujui != null)
                                  ? "${data.kesayaDisetujui}"
                                  : '0',
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Text(
                          "Approved",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await Get.toNamed(Routes.HAZARD_P_J, parameters: {
                        "option": "saya",
                        "disetujui": "2",
                        "judul": "Hazard Report Ke Saya"
                      });
                      controller.getPref();
                    },
                    child: Column(
                      children: [
                        Text(
                            (data.kesayaDibatalkan != null)
                                ? "${data.kesayaDibatalkan}"
                                : '0',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        const Text(
                          "Canceled",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
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
