import 'package:face_id_plus/app/data/models/lampiran_rkb.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rkb_lampiran_controller.dart';

class RkbLampiranView extends GetView<RkbLampiranController> {
  const RkbLampiranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Lampiran'),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children:
              controller.data.map((element) => lampiranCard(element)).toList(),
        ),
      ),
    );
  }

  Widget lampiranCard(Lampiran data) {
    if (kDebugMode) {
      print("lampiran  ${data.file}");
    }
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          if (data.file!.contains(".jpg")) {
            if (kDebugMode) {
              print("${data.file}");
            }
            Get.toNamed(Routes.IMAGE_HAZARD_VIEW, arguments: {
              "image":
                  "https://lp.abpjobsite.com/api/v1/rkb/lampiran/open/${data.file}",
              "loaded": true,
              "rkbImage": true
            });
          } else if (data.file!.contains(".jpg")) {
          } else {}
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: (data.file!.contains(".pdf"))
              ? const Icon(
                  Icons.picture_as_pdf_rounded,
                  size: 60,
                )
              : (data.file!.contains(".jpg"))
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://lp.abpjobsite.com/api/v1/rkb/lampiran/open/${data.file}",
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : const Icon(Icons.file_copy_rounded, size: 60),
        ),
      ),
    );
  }
}
