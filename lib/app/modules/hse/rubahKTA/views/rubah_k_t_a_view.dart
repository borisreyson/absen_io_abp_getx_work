import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rubah_k_t_a_controller.dart';

class RubahKTAView extends GetView<RubahKTAController> {
  const RubahKTAView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori Bahaya"),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 10,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context, "KONDISI TIDAK AMAN");
              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text("KONDISI TIDAK AMAN"),
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context, "TINDAKAN TIDAK AMAN");
              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text("TINDAKAN TIDAK AMAN"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
