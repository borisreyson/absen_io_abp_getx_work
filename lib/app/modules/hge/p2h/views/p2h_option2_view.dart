import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class P2hOption2View extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PEMERIKSAAN AWAL KEGIATAN'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              formMiddle(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 110,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.P2H_PDF);
                      },
                      child: Row(
                        children: const [
                          Text("Selesai"),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget formMiddle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Align(
                      alignment: Alignment.topLeft, child: Text("Roda Depan")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kanan"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kiri"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Roda Belakang")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kanan"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kiri"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Lampu - Lampu / Lights")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Lampu Parkir"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Lampu Depan"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Lampu Jauh"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Lampu Rem"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Lampu Bahaya / Hazard"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Lampu Mundur"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Lampu Penunjuk / Sign")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Depan Kanan"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Depan Kiri"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Belakang Kanan"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Belakang Kiri"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Align(
                      alignment: Alignment.topLeft, child: Text("Additional")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kotak P3K"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Ada"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kondisi"),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            const Text("Baik"),
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {}),
                            const Text("Tidak"),
                            Radio(
                                value: 2,
                                groupValue: 'null',
                                onChanged: (index) {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
