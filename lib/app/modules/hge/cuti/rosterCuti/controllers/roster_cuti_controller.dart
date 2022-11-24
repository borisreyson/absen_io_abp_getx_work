import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/roster_cuti_karyawan.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RosterCutiController extends GetxController {
  final provider = ProviderCuti();
  final rosterCuti = <Data>[].obs;
  final lastPage = 1.obs;
  final nik = RxnString(null);
  final page = 1.obs;
  DateFormat fmt = DateFormat('dd MMMM yyyy');
  DateFormat fmtDBMS = DateFormat('yyyy-mm-dd');
  final nama = RxnString(null);
  final argumen = false.obs;
  final textPeneyesuaian = RxnString(null);
  final mulai = RxnString(null);
  final selesai = RxnString(null);
  final dt = DateTime.now();
  final dataSend = Data().obs;

  final dari = DateTime.now().obs, sampai = DateTime.now().obs;
  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, minTime: dt, currentTime: initDate);
  }

  @override
  void onInit() async {
    var cek = await Get.arguments;
    if (cek != null) {
      argumen.value = cek['argumen'];
      print("${argumen.value}");
    }
    var pref = await SharedPreferences.getInstance();
    nik.value = pref.getString(Constants.nik);
    nama.value = pref.getString(Constants.name);
    if (nik.value != null) {
      getCuti(nik.value, page.value);
    }
    super.onInit();
  }

  getCuti(nik, hal) async {
    await provider.rosterCutiKaryawan(nik: nik, page: hal).then((value) {
      var result = value.rosterKaryawan;
      print("${result?.currentPage}");

      if (result != null) {
        lastPage.value = int.parse("${result.lastPage}");
        var data = result.data;
        if (data != null) {
          rosterCuti.addAll(data);
        }
      }
    });
  }

  Widget submitWidgetDTrange() {
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return Card(
      color: Colors.orange,
      elevation: 10,
      child: InkWell(
          onTap: () async {
            mulai.value = fmt.format(dari.value);
            selesai.value = fmt.format(sampai.value);
            dataSend.value.tglMulaiCuti = fmtDBMS.format(dari.value);
            dataSend.value.tglSelesaiCuti = fmtDBMS.format(sampai.value);
            var durasiCuti =
                "${fmt.format(dari.value)} - ${fmt.format(sampai.value)}";
            textPeneyesuaian.value = durasiCuti;

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

  Widget tglPick(String title, initial) {
    var inital = initial;
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return StatefulBuilder(
      builder: (context, stateSet) {
        return Card(
          color: Colors.orange,
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
}
