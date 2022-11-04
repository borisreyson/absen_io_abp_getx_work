import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetSarpras {
  Widget listSarprasIT() {
    return Card(
      color: Colors.blue,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SARPRAS_IT);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "List Sarpras Kordinator",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget listSarprasKabag() {
    return Card(
      color: Colors.orange,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SARPRAS_KABAG);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "List Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget listSarprasKTT() {
    return Card(
      color: Colors.green,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SARPRAS_KTT);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "List Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget listSarprasSection() {
    return Card(
      color: Colors.red,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SARPRAS_SECTION);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "List Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget listSarprasHc() {
    return Card(
      color: Colors.lime,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SARPRAS_HC);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.list_alt_outlined,
                  color: Colors.black,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "List Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget listSarprasUser() {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SARPRAS_USER);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.list_alt_outlined,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "List Sarpras",
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget listSarprasKordinator() {
    return Card(
      color: Colors.grey,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SARPRAS_KORDINATOR);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "List Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget approveSarprasKabag() {
    return Card(
      color: Colors.blue,
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.approval_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "Approve Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget approveSarprasSection() {
    return Card(
      color: Colors.orange,
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.approval_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "Approve Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget approveSarprasHC() {
    return Card(
      color: Colors.green,
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.approval_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "Approve Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget approveSarprasKordinator() {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.approval_outlined,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "Approve Sarpras",
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget listSarprasSecurity() {
    return Card(
      color: Colors.red,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SARPRAS_SECURITY);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Center(
                  child: Text(
                    "List Sarpras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget listSarana() {
    return Card(
      color: Colors.black,
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  CupertinoIcons.car_detailed,
                  size: 50,
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    "Data Unit Sarana",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget formKeluarLv() {
    return Card(
      color: Colors.red,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.FORM_SARANA);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  CupertinoIcons.doc_richtext,
                  size: 50,
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    "Form Izin Keluar Sarana",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget formIzinKeluar() {
    return Card(
      color: Colors.orange,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.FORM_IZIN_KELUAR);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  CupertinoIcons.doc_richtext,
                  size: 50,
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    "Form Izin Keluar",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget scanBarcodeSarpras() {
    return Card(
      color: Colors.brown,
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SCAN_Q_R);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.qr_code_scanner_rounded,
                  size: 50,
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    "Scan QR Code",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
