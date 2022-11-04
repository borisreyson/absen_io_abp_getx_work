import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back(result: false);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                namaWidget(),
                InkWell(
                  onTap: () {
                    Get.toNamed('/list-absen');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        border: Border(
                      top: BorderSide(color: Colors.black, width: 1),
                    )),
                    child: Row(
                      children: const [
                        Icon(Icons.people),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("List Absen"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Card(
                color: const Color.fromARGB(255, 144, 24, 15),
                child: InkWell(
                  onTap: () {
                    controller.logOut();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app, color: Colors.white),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "Keluar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget namaWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipOval(
            child: Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade200,
                child: CachedNetworkImage(
                  placeholder: (contex, url) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(
                        Icons.person,
                        size: 70,
                      ),
                    );
                  },
                  imageUrl: "${controller.foto.value}",
                  fit: BoxFit.fitWidth,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${controller.nama.value}"),
                Text("${controller.nik.value}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
