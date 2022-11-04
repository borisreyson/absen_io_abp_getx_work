import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static const intro = "intro";
  static const String isLoginAbp = "isLoginAbp";
  static const String username = "userName";
  static const String nik = "nik";
  static const String name = "name";
  static const String rule = "rule";
  static const String departement = "departement";
  static const String section = "section";
  static const String jabatan = "jabatan";
  static const String level = "level";
  static const String fotoProfile = "fotoProfile";
  static const String ttd = "ttd";
  static const String company = "company";
  static const String baseUrl = "https://lp.abpjobsite.com/";
  static const String mainUrl = "https://abpjobsite.com/";
  static const String kemungkinanTb = "KEMUNGKINAN";
  static const String keparahanTb = "KEPARAHAN";
  static const String metrikTb = "METRIK";
  static const String perusahaanTb = "PERUSAHAAN";
  static const String lokasiTb = "LOKASI";
  static const String detKeparahanTb = "DETAIL_KEPARAHAN";
  static const String pengendalianTb = "PENGENDALIAN";
  static const String detPengendalianTb = "DETAIL_PENGENDALIAN";
  static const String usersTb = "USERS";
  static const String deviceUpdatTb = "DEVICE_UPDATE";
  static const String karyawanCutiTb = "DATA_CUTI_KARYAWAN";
  static const String cutiTb = "DATA_CUTI";
  static const String pesanTiketCutiTb = "PESAN_TIKET_CUTI";
  static const String p2hHeader = "P2H_HEADER";
  static const String p2hDetail = "P2H_DETAIL";
  static const String p2hTemuan = "P2H_TEMUAN";
  static const String p2hPemeriksaan = "P2H_PEMERIKSAAN";
  static const Color green = Color(0xFF488C03);

  late StreamSubscription subscriptionVps;
  late StreamSubscription subscriptionServer;
  late StreamSubscription subscriptionLokal;
  late StreamSubscription subscriptionServerOnline;

//ABSENSi
  static const String isLogin = "isLoginAbsensi";
  static const String nikAbsen = "nikAbsen";
  static const String namaAbsen = "namaAbsen";
  static const String departemenAbsen = "departemenAbsen";
  static const String devisiAbsen = "devisiAbsen";
  static const String jabatanAbsen = "jabatanAbsen";
  static const String flagAbsen = "flagAbsen";
  static const String showAbsen = "showAbsen";
  static const String perusahaanAbsen = "perusahaanAbsen";

  static const String versiAplikasi = "versiAplikasi";

  // ignore: non_constant_identifier_names
  sign_out(context) async {
    var pref = await SharedPreferences.getInstance();
    var logOut = await pref.remove(isLoginAbp);
    if (logOut) {
      return true;
    } else {
      return false;
    }
  }

  goTo(Function() toPage, BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => toPage()));
  }

  goToReplace(Function() toPage, BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => toPage()));
  }

  showMyDialog(BuildContext context, String judul) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(judul),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Apakah Anda Yakin?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ya , Keluar'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }

  showAlert({
    String? judul,
    String? msg,
    bool enBtn = true,
    bool loading = false,
    bool dismiss = false,
    bool del = false,
    Color? color,
    String? fBtn,
    String? sBtn,
  }) {
    return Get.defaultDialog(
      barrierDismissible: dismiss, // user must tap button!
      backgroundColor: (color != null) ? color : null,
      title: (judul != null) ? judul : "",
      content: (loading)
          ? const CupertinoActivityIndicator(
              radius: 40,
            )
          : (msg != null)
              ? SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Center(child: Text(msg)),
                    ],
                  ),
                )
              : null,
      actions: (enBtn)
          ? <Widget>[
              (del)
                  ? TextButton(
                      child: Text("$fBtn"),
                      onPressed: () {
                        Get.back(result: true);
                      },
                    )
                  : TextButton(
                      child: const Text('OK!'),
                      onPressed: () {
                        Get.back(result: false);
                      },
                    ),
              (del)
                  ? TextButton(
                      child: Text("$sBtn"),
                      onPressed: () {
                        Get.back(result: false);
                      },
                    )
                  : Container()
            ]
          : null,
    );
  }

  showFormAlert({
    String? judul,
    bool enBtn = true,
    bool dismiss = false,
    Color? color,
    String? fBtn,
    String? sBtn,
    String? label = "Data",
    bool validate = true,
  }) {
    return Get.defaultDialog<void>(
      barrierDismissible: dismiss, // user must tap button!
      title: "$judul",
      content: CustomDialog(
        dismiss,
        fBtn,
        sBtn,
        label,
        validate,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomDialog extends StatefulWidget {
  bool enBtn = true;
  bool dismiss = false;
  Color? color;
  String? fBtn;
  String? sBtn;
  String? label = "Data";
  bool validate = true;
  CustomDialog(this.dismiss, this.fBtn, this.sBtn, this.label, this.validate,
      {Key? key})
      : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final _formKey = GlobalKey<FormState>();
  final Color _warna = const Color(0xFF591505);
  final _formFocus = FocusNode();
  final _formController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              child: ListBody(
                children: [
                  TextFormField(
                    controller: _formController,
                    maxLines: 5,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _warna)),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _warna)),
                      labelStyle: TextStyle(color: _warna),
                      alignLabelWithHint: true,
                      labelText: "${widget.label}",
                      hintText: "${widget.label}",
                    ),
                    focusNode: _formFocus,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '${widget.label} Wajib Di Isi';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Get.back(result: [true, _formController.text]);
                  } else {
                    _formFocus.requestFocus();
                  }
                },
                child: Text("${widget.fBtn}"),
              ),
              TextButton(
                onPressed: () {
                  Get.back(result: [false]);
                },
                child: Text("${widget.sBtn}"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
