import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/models/p2h_temuan_models.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/lihat_temuan_p2h_controller.dart';

class LihatTemuanP2hView extends GetView<LihatTemuanP2hController> {
  const LihatTemuanP2hView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Temuan P2h'),
          centerTitle: true,
        ),
        body: (controller.loaded.value)
            ? Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ListView(
                      children:
                          controller.data.map((e) => cardItem(e)).toList(),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
      ),
    );
  }

  Widget cardItem(P2hTemuan e) {
    return SizedBox(
      width: Get.width,
      child: Card(
        margin: const EdgeInsets.all(5),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${e.diperiksa}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        (e.p2hKetersediaan?.capitalize ?? ""),
                        style: TextStyle(
                            color: (e.p2hKetersediaan == "ada")
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      if (e.p2hKetersediaan != null)
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("- Kondisi"),
                  ),
                  Row(
                    children: [
                      Text(
                        (e.p2hKondisi == "baik")
                            ? "Baik"
                            : (e.p2hKondisi == "tidak_baik")
                                ? "Tidak Baik"
                                : "-",
                        style: TextStyle(
                            color: (e.p2hKondisi == "baik")
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      if (e.p2hKondisi != null)
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Foto Temuan"),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.VIEW_IMAGE, arguments: {
                            "urlImage": "${controller.basUrl}${e.p2hFotoTemuan}"
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: "${controller.basUrl}${e.p2hFotoTemuan}",
                            fit: BoxFit.cover,
                            placeholder: (contex, url) {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const Center(
                                child: Icon(
                                  Icons.broken_image_rounded,
                                  size: 95,
                                  color: Color.fromARGB(255, 235, 104, 95),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
