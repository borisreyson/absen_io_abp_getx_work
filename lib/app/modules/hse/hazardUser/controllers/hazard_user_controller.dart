import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/models/data_hazard.dart';
import '../../../../data/providers/provider.dart';
import '../../../../data/utils/constants.dart';

class HazardUserController extends GetxController {
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
    await getPref();
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
          if (kDebugMode) {
            print("dataRes ${dataRes.length}");
          }
          for (var element in dataRes) {
            data.add(element);
          }
        }
      }
    });

    super.onInit();
  }

  @override
  void onClose() {}

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    rule.value = "${pref.getString(Constants.rule)}";
    username.value = "${pref.getString(Constants.username)}";
    nik.value = "${pref.getString(Constants.nik)}";
  }

  void onRefresh() async {
    data.value = [];
    page = 1;
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
    } else {
      pullRefresh.refreshCompleted();
      pullRefresh.loadComplete();
    }
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

  Widget tglPick(String title, initial) {
    var inital = initial;
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return StatefulBuilder(
      builder: (context, stateSet) {
        return Card(
          color: hseColor,
          elevation: 10,
          child: InkWell(
              onTap: () async {
                var selected = await selectDate(context, inital!);
                if (selected != null) {
                  if (title == "Dari") {
                    stateSet(() {
                      dari.value = selected;
                      inital = selected;
                    });
                  } else if (title == "Sampai") {
                    stateSet(() {
                      sampai.value = selected;
                      inital = selected;
                    });
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: style,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(fmt.format(inital!), style: style),
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget submitWidgetDTrange() {
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return Card(
      color: hseColor,
      elevation: 10,
      child: InkWell(
          onTap: () async {
            if (kDebugMode) {
              print("dari ${fmt.format(dari.value)}");
            }
            if (kDebugMode) {
              print("dari ${fmt.format(sampai.value)}");
            }
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
                  if (kDebugMode) {
                    print("dataRes ${dataRes.length}");
                  }
                  for (var element in dataRes) {
                    data.add(element);
                  }
                }
              }
            });

            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Submit",
                  style: style,
                ),
              ],
            ),
          )),
    );
  }

  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, maxTime: dt, currentTime: initDate);
  }
}
