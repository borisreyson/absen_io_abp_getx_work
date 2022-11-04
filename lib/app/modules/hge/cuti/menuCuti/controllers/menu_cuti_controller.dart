import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuCutiController extends GetxController {
  final indexCount = 1.obs;
  final listCuti = <Widget>[].obs;
  List<String>? rule = [];

  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    rule = pref.getString(Constants.rule)?.split(',');
    var nik = pref.getString(Constants.nik);

    if (nik!.contains("18060207")) {
      listCuti.value = [
        listCutiWidget(),
        formCutiWidget(),
        rosterCutiWidget(),
        maskapaiWidget(),
        atasanWidget(),
        deptHeadWidget(),
        kttWidget(),
        hcWidget(),
      ];
    } else if (rule!.contains("cuti_depthead")) {
      listCuti.value = [
        listCutiWidget(),
        formCutiWidget(),
        rosterCutiWidget(),
        atasanWidget(),
        deptHeadWidget(),
      ];
    } else if (rule!.contains("cuti_ktt")) {
      listCuti.value = [
        listCutiWidget(),
        formCutiWidget(),
        rosterCutiWidget(),
        atasanWidget(),
        kttWidget(),
      ];
    } else if (rule!.contains("cuti_hc")) {
      listCuti.value = [
        listCutiWidget(),
        formCutiWidget(),
        rosterCutiWidget(),
        maskapaiWidget(),
        atasanWidget(),
        hcWidget(),
      ];
    } else {
      listCuti.value = [
        listCutiWidget(),
        formCutiWidget(),
        rosterCutiWidget(),
        atasanWidget(),
      ];
    }

    super.onInit();
  }

  Widget listCutiWidget() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.LIST_CUTI);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/list_cuti_ic.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "Pengajuan Cuti",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget atasanWidget() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.CUTI_KE_ATASAN);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/list_cuti_ic.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "Pengajuan Cuti Ke Atasan",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget deptHeadWidget() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.CUTI_KE_DEPT_HEAD);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/list_cuti_ic.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "Pengajuan Cuti Ke Dept Head",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget kttWidget() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.CUTI_KE_K_T_T);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/list_cuti_ic.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "Pengajuan Cuti Ke KTT / Mine Manager",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget hcWidget() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.CUTI_KE_H_C);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/list_cuti_ic.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "Pengajuan Cuti Ke HC",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget formCutiWidget() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.FORM_CUTI);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/roster_add_ic.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "Form Cuti",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rosterCutiWidget() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.ROSTER_CUTI);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/roster_ic.png',
                width: 50,
                height: 50,
              ),
              const Text(
                "Roster Cuti",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget maskapaiWidget() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.MASKAPAI_LIST);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                CupertinoIcons.airplane,
                size: 60,
                color: Colors.blue,
              ),
              Text(
                "Maskapai Penerbangan",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
