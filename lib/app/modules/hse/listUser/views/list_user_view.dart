import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/models/users_model.dart';
import '../controllers/list_user_controller.dart';

class ListUserView extends GetView<ListUserController> {
  const ListUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: controller.searchBar,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            (controller.cari.value)
                ? IconButton(
                    onPressed: () {
                      controller.searchBar = const Text("Penanggung Jawab");
                      controller.cari.value = false;
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      controller.searchBar = appSearch(context);
                      controller.cari.value = true;
                      controller.cariFocus.requestFocus();
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                    ),
                  )
          ],
        ),
        body: ListView(
          children: controller.data.map((e) => widgetCard(e)).toList(),
        ),
      ),
    );
  }

  Widget widgetCard(UsersList e) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.back(result: e);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (e.photoProfile != null)
                ? SizedBox(
                    width: 110,
                    child: Image.network(
                      "${e.photoProfile}",
                      fit: BoxFit.fill,
                    ),
                  )
                : const Icon(
                    Icons.person,
                    size: 100,
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${e.namaLengkap}",
                      textAlign: TextAlign.right,
                    ),
                    Text("${e.nik}"),
                    Text("${e.dept}"),
                    Text("${e.namaPerusahaan}"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appSearch(BuildContext context) {
    return TextField(
      focusNode: controller.cariFocus,
      cursorColor: Colors.white,
      style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)),
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)),
          hintText: " Cari . . .",
          hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      onChanged: (name) {
        controller.cariUser(name);
      },
      controller: controller.cariController,
    );
  }
}
