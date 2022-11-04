import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/counter_hazard.dart';
import '../../../../data/models/user_profile.dart';
import '../controllers/corrective_action_controller.dart';
import 'hazard_pj.dart';
import 'hazard_seluruh.dart';
import 'hazard_user.dart';

class CorrectiveActionView extends GetView<CorrectiveActionController> {
  const CorrectiveActionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: controller.gradient,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Center(child: Text(controller.tglSekarang.value)),
              IconButton(
                  onPressed: () async {
                    controller.isLoading.value = true;
                    controller.profile.value.dataUser = null;
                    await controller.getRepository();
                  },
                  icon: const Icon(Icons.refresh))
            ],
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: listWidget(),
        ),
      ),
    );
  }

  Widget listWidget() {
    return ListView(
      children: [
        Center(
          child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: (controller.fotoProfile != null)
                          ? CachedNetworkImage(
                              height: 80,
                              fit: BoxFit.fill,
                              imageUrl: controller.fotoProfile!,
                              placeholder: (context, url) => const Center(
                                child: CupertinoActivityIndicator(radius: 40),
                              ),
                            )
                          : const Image(
                              image: AssetImage('assets/images/ic_abp.png'),
                              height: 40,
                            )),
                ),
              )),
        ),
        Center(
          child: (controller.profile.value.dataUser != null)
              ? Text(
                  "${controller.profile.value.dataUser?.namaLengkap}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              : const CupertinoActivityIndicator(),
        ),
        Card(
          elevation: 20,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: _userProf(controller.profile.value),
        ),
        _menuCar(controller.userCounter.value),
      ],
    );
  }

  Widget _userProf(profile) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "Hazard",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: controller.hazardMenu),
              ),
              Text(
                (!controller.isLoading.value) ? "${profile.dataHazard}" : '0',
                style: TextStyle(
                  color: controller.hazardMenu,
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 143, 24, 16)),
                onPressed: () async {
                  await Get.toNamed(Routes.FORM_HAZARD);
                  controller.getPref();
                },
                child: const Text(
                  "Buat Hazard",
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Inspeksi",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: controller.hazardMenu),
              ),
              Text(
                (!controller.isLoading.value) ? "${profile.datInspeksi}" : '0',
                style: TextStyle(color: controller.hazardMenu, fontSize: 20),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 175, 121, 5)),
                onPressed: () {},
                child: const Text(
                  "Buat Inspeksi",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuCar(data) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          (controller.profile.value.dataUser != null)
              ? _hazard(data)
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 30,
                    ),
                  ),
                ),
          (controller.profile.value.dataUser != null)
              ? _hazardKeSaya(controller.profile.value.dataUser!, data)
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 30,
                    ),
                  ),
                ),
          Visibility(
            // ignore: invalid_use_of_protected_member
            visible: (controller.rule.value.contains("admin_hse")),
            child: (controller.profile.value.dataUser != null)
                ? _hazardSeluruh(controller.profile.value.dataUser!, data)
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                        radius: 30,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _hazard(CounterHazard data) {
    return HazardUser(controller: controller, data: data);
  }

  Widget _hazardKeSaya(
    DataUser profile,
    CounterHazard data,
  ) {
    return HazardPJ(controller: controller, data: data, profile: profile);
  }

  Widget _hazardSeluruh(
    DataUser profile,
    CounterHazard data,
  ) {
    return HazardSeluruh(controller: controller, profile: profile, data: data);
  }
}
