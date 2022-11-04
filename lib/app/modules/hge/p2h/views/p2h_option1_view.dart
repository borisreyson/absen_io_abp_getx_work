import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class P2hOption1View extends GetView {
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
                    width: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.P2H_OPTION_2);
                      },
                      child: Row(
                        children: const [
                          Text("Lanjut"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Minyak Rem / Brake Fluid"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Oli Mesin / Engine Oil"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Air Accumulator"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Air Radiator / Engine Cooling Water"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Oil Steer / Power Steering Oil"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Air Wiper"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Sabuk Pengaman / Seat Belt"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Segitiga Pengaman / Triangel / \nSafety Cone"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("APAR"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Kunci Ban / Dongkrak"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Ban Cadangan"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Klakson"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Rotary Lamp / Strobe Light"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Alarm Mundur"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Tiang Bendera / Stickpole"),
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
