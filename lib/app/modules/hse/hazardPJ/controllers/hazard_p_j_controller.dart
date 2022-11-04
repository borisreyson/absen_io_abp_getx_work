import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/models/data_hazard.dart';
import '../../../../data/providers/provider.dart';
import '../../../../data/utils/constants.dart';

class HazardPJController extends GetxController {
  final provider = HazardProvider();
  final option = ''.obs;
  final disetujui = 0.obs;
  final Color hseColor = const Color.fromARGB(255, 199, 134, 22);
  int page = 1;
  final data = <Data>[].obs;
  int lastPage = 0;
  int toIndex = 0;
  final RefreshController pullRefresh =
      RefreshController(initialRefresh: false);
  final dari = DateTime.now().obs, sampai = DateTime.now().obs;
  DateTime dt = DateTime.now();
  DateFormat fmt = DateFormat('dd MMMM yyyy');
  DateTime firstDate = DateTime.now();
  final rule = ''.obs;
  final username = ''.obs;
  final selectedIndex = 0.obs;
  final isLoading = false.obs;
  final pullUp = true.obs;
  final nik = ''.obs;
  final List colorList = const <Color>[
    Color.fromARGB(255, 173, 140, 5),
    Color.fromARGB(255, 19, 122, 22),
    Color.fromARGB(255, 169, 3, 3)
  ];
  final judul = ''.obs;
  @override
  void onInit() async {
    await _getPref();
    var parm = Get.parameters;
    option.value = "${parm['option']}";
    selectedIndex.value = int.parse("${parm['disetujui']}");
    disetujui.value = selectedIndex.value;
    judul.value = "${parm['judul']}";

    //
    firstDate = DateTime(dt.year, dt.month, 01);
    dari.value = firstDate;
    sampai.value = dt;

    await provider
        .getHazardKeSaya(
      nik.value,
      selectedIndex.value,
      page,
      fmt.format(dari.value),
      fmt.format(sampai.value),
    )
        .then((result) {
      if (result != null) {
        lastPage = result.lastPage!;
        if (page == lastPage) {
          pullUp.value = false;
        } else {
          pullUp.value = true;
        }
        if (kDebugMode) {
          print("halaman2 : $page : $lastPage");
        }
        if (result.to != null) {
          toIndex = result.to!;
        }
        pullRefresh.loadComplete();
        pullRefresh.refreshCompleted();
        var dataRes = result.data;
        if (dataRes != null) {
          for (var element in dataRes) {
            data.add(element);
          }
        }
      }
    });

    super.onInit();
  }
  fetchData()async{
    await provider
        .getHazardKeSaya(
      nik.value,
      selectedIndex.value,
      page,
      fmt.format(dari.value),
      fmt.format(sampai.value),
    )
        .then((result) {
      if (result != null) {
        lastPage = result.lastPage!;
        if (page == lastPage) {
          pullUp.value = false;
        } else {
          pullUp.value = true;
        }
        if (kDebugMode) {
          print("halaman2 : $page : $lastPage");
        }
        if (result.to != null) {
          toIndex = result.to!;
        }
        pullRefresh.loadComplete();
        pullRefresh.refreshCompleted();
        var dataRes = result.data;
        if (dataRes != null) {
          for (var element in dataRes) {
            data.add(element);
          }
        }
      }
    });
  }

  @override
  void onClose() {}
  _getPref() async {
    var pref = await SharedPreferences.getInstance();
    rule.value = "${pref.getString(Constants.rule)}";
    username.value = "${pref.getString(Constants.username)}";
    nik.value = "${pref.getString(Constants.nik)}";
  }

  void onItemTapped(int index) {
    dari.value = firstDate;
    sampai.value = dt;
    page = 1;
    data.clear();
    selectedIndex.value = index;
    isLoading.value = false;

    pullRefresh.isLoading;
    onRefresh();
  }

  void onRefresh() async {
    data.value = [];
    page = 1;
    await provider
        .getHazardKeSaya(
      nik.value,
      selectedIndex.value,
      page,
      fmt.format(dari.value),
      fmt.format(sampai.value),
    )
        .then((result) {
      if (result != null) {
        lastPage = result.lastPage!;
        if (page == lastPage) {
          pullUp.value = false;
        } else {
          pullUp.value = true;
        }
        if (kDebugMode) {
          print("halaman2 : $page : $lastPage");
        }
        if (result.to != null) {
          toIndex = result.to!;
        }
        pullRefresh.loadComplete();
        pullRefresh.refreshCompleted();
        var dataRes = result.data;
        if (dataRes != null) {
          for (var element in dataRes) {
            data.add(element);
          }
        }
      }
    });
  }

  void reload({bool s = false}) async {
    data.clear();
    page = 1;
    if (s) {
      await provider
          .getHazardUser(
        username.value,
        selectedIndex.value,
        page,
        fmt.format(dari.value),
        fmt.format(sampai.value),
      )
          .then((result) {
        if (result != null) {
          lastPage = result.lastPage!;
          if (page == lastPage) {
            pullUp.value = false;
          } else {
            pullUp.value = true;
          }
          if (kDebugMode) {
            print("halaman2 : $page : $lastPage");
          }
          if (result.to != null) {
            toIndex = result.to!;
          }
          pullRefresh.loadComplete();
          pullRefresh.refreshCompleted();
          var dataRes = result.data;
          if (dataRes != null) {
            for (var element in dataRes) {
              data.add(element);
            }
          }
        }
      });
    }
  }

  void onLoading() async {
    if (page < lastPage) {
      isLoading.value = true;
      page++;
      await provider
          .getHazardKeSaya(
        nik.value,
        selectedIndex.value,
        page,
        fmt.format(dari.value),
        fmt.format(sampai.value),
      )
          .then((result) {
        if (result != null) {
          var dataRes = result.data;
          if (dataRes != null) {
            for (var element in dataRes) {
              data.add(element);
            }

            pullRefresh.refreshCompleted();
            pullRefresh.loadComplete();
          }
        }
      });
    } else {
      pullRefresh.refreshCompleted();
      pullRefresh.loadComplete();
      if (page == lastPage) {
        pullUp.value = false;
      } else {
        pullUp.value = true;
      }
    }
  }
}
