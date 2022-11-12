import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_id_plus/app/data/utils/background.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/profile_abp_controller.dart';

class ProfileAbpView extends GetView<ProfileAbpController> {
  const ProfileAbpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back(result: false);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Stack(
          children: [
            const Background(
                topPrimary: Colors.blue,
                topSecondary: Colors.amberAccent,
                bottomPrimary: Colors.grey,
                bottomSecondary: Colors.red,
                bgColor: Colors.white),
            ListView(
              children: [
                foto(),
                nama(),
                nik(),
                widgetMenus(),
              ],
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () async {
                        Get.toNamed(Routes.GANTI_SANDI_FORM,
                            arguments: {"data": controller.dataLogin.value});
                      },
                      icon: const Icon(Icons.key_rounded),
                      label: const Text("Ganti Sandi"),
                    ),
                    ElevatedButton.icon(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () async {
                        var res = await Constants()
                            .showMyDialog(context, "Keluarkan Akun?");
                        if (res) {
                          // ignore: use_build_context_synchronously
                          var exit = await Constants().sign_out(context);
                          Get.back(result: exit);
                        }
                      },
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text("Keluar"),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget foto() {
    print("foto ${controller.foto.value}");
    return Container(
      child: (controller.foto.value != null)
          ? InkWell(
              onTap: () {
                Get.toNamed(Routes.IMAGE_HAZARD_VIEW, arguments: {
                  "image": controller.foto.value,
                  "loaded": true
                });
              },
              child: Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: "${controller.foto.value}",
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(radius: 40),
                        ),
                        errorWidget: (context, url, err) => const Center(
                          child: CupertinoActivityIndicator(radius: 40),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const CupertinoActivityIndicator(
              radius: 20,
              color: Colors.red,
            ),
    );
  }

  Widget nama() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Center(
          child: Text(
        "${controller.nama.value}",
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline),
      )),
    );
  }

  Widget nik() {
    return Center(child: Text("${controller.nik.value}"));
  }

  Widget jabatan() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(child: Text("${controller.jabatan.value}")),
    );
  }

  Widget dept() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(child: Text("${controller.dept.value}")),
    );
  }

  Widget perusahaan() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(child: Text("${controller.perusahaan.value}")),
    );
  }

  Widget widgetMenus() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          margin: const EdgeInsets.all(5),
          elevation: 5,
          child: InkWell(
            onTap: () async {
              await Get.toNamed(Routes.GANTI_FOTO,
                  arguments: {'foto': controller.foto.value});
              controller.getPref();
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.co_present_outlined),
                  Text(
                    "Rubah Foto Profil",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
        // Card(
        //   margin: const EdgeInsets.all(5),
        //   elevation: 5,
        //   child: InkWell(
        //     onTap: () async {
        //       await Get.toNamed(Routes.RUBAH_DATA);
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.all(10),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: const [
        //           Icon(CupertinoIcons.person_crop_circle_fill_badge_exclam),
        //           Text(
        //             "Rubah Data",
        //             style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.bold),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // Card(
        //   margin: const EdgeInsets.all(5),
        //   elevation: 5,
        //   child: InkWell(
        //     onTap: () async {
        //       await Get.toNamed(Routes.ALARM_PLAYER);
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.all(10),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: const [
        //           Icon(CupertinoIcons.alarm),
        //           Text(
        //             "Alaram",
        //             style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.bold),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        Card(
          margin: const EdgeInsets.all(5),
          elevation: 5,
          child: InkWell(
            onTap: () async {
              await Get.toNamed(Routes.SIGNATURE_VIEW);
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(CupertinoIcons.signature),
                  Text(
                    "Tanda Tangan",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
