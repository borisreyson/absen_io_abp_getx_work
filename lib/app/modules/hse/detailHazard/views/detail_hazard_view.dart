import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../data/models/data_hazard.dart';
import '../../../../data/utils/constants.dart';
import '../controllers/detail_hazard_controller.dart';

class DetailHazardView extends GetView<DetailHazardController> {
  const DetailHazardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = controller.data.value;
    return Obx(
      () => Scaffold(
          backgroundColor: const Color.fromARGB(255, 221, 219, 219),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            title: const Text("Detail Hazard"),
          ),
          body: _listWidget(data, context),
          floatingActionButton: (data.statusPerbaikan != "SELESAI")
              ? FloatingActionButton(
                  onPressed: () async {
                    bool alert = await Constants().showAlert(
                        judul: "Update Hazard Report",
                        del: true,
                        msg: "Apakah anda yakin?",
                        fBtn: "Ya, Update Hazard",
                        sBtn: "Tidak");
                    if (alert) {
                      Constants().showAlert(
                          dismiss: false, loading: true, enBtn: false);
                      bool stat = await Get.toNamed(Routes.RUBAH_HAZARD,
                          arguments: {"detail": data});

                      if (stat) {
                        Get.back(result: stat);
                        // ignore: use_build_context_synchronously
                        _reload(context);
                      } else {
                        Get.back(result: stat);
                      }
                    }
                  },
                  child: const Icon(Icons.upload_file_outlined),
                )
              : null),
    );
  }

  Widget _listWidget(Data data, context) {
    return ListView(
      children: [
        _loadImage(data),
        _dataTemuan(data, context),
        _deskBahaya(data, context),
        _rkemSebelum(context),
        _rkepSebelum(context),
        _totalResiko(context),
        _katBahaya(data, context),
        _tindakanPerbaikan(data, context),
        _statusPerbaikan(data, context),
        (data.updateBukti != null)
            ? _gambarPerbaikan(data, context)
            : Container(),
        Visibility(
            visible: (data.statusPerbaikan == "SELESAI"),
            child: _rkemSetelah(data, context)),
        Visibility(
            visible: (data.statusPerbaikan == "SELESAI"),
            child: _rKepSesudah(data, context)),
        Visibility(
            visible: (data.statusPerbaikan == "SELESAI"),
            child: _totalResikoSesudah(data, context)),
        _penanggungJawab(data, context),
      ],
    );
  }

  Widget _loadImage(Data data) {
    return SizedBox(
        height: 300,
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.IMAGE_HAZARD_VIEW,
                arguments: {"image": controller.bukti.value, "loaded": true});
          },
          child: (controller.bukti.value != null
              ? CachedNetworkImage(
                  imageUrl: controller.bukti.value!,
                  fit: BoxFit.cover,
                  placeholder: (contex, url) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
        ));
  }

  Widget _dataTemuan(Data data, context) {
    var fmt = DateFormat("dd MMMM yyyy");
    var titikDua = ": ";
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 6, 117, 10),
          padding: const EdgeInsets.all(10),
          child: const Text(
            "1. Data Temuan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          elevation: 10,
          margin:
              const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2)
              },
              children: [
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Perusahaan"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(titikDua + data.perusahaan!),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Tanggal"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        titikDua + fmt.format(DateTime.parse(data.tglHazard!))),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Jam"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(titikDua + data.jamHazard!),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Lokasi"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(titikDua + data.lokasiHazard!),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Detail Lokasi"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(titikDua + data.lokasiDetail!),
                  ),
                ]),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _deskBahaya(Data data, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 6, 117, 10),
          padding: const EdgeInsets.all(10),
          child: const Text(
            "2. Deskripsi Bahaya",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
            elevation: 10,
            margin:
                const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${data.deskripsi}")))
      ],
    );
  }

  Widget _rkemSebelum(context) {
    var rkemSebelum = controller.kmSebelum.value;
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.orangeAccent,
        padding: const EdgeInsets.all(10),
        child: const Center(
          child: Text(
            "Resiko Kemungkinan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${rkemSebelum.kemungkinan}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text("Nilai"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("${rkemSebelum.nilai}"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _rkepSebelum(context) {
    var rkepSebelum = controller.kpSebelum.value;

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: Text(
              "Resiko Keparahan",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${rkepSebelum.keparahan}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Nilai"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${rkepSebelum.nilai}"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _totalResiko(context) {
    var resiko = controller.resikoSebelum.value;
    var txtColor = int.parse("0xffffffFF");
    var bgColor = int.parse("0xffffffff");
    if (resiko.txtColor != null && resiko.bgColor != null) {
      txtColor = int.parse("0xff${resiko.txtColor!.split("#")[1]}");
      bgColor = int.parse("0xff${resiko.bgColor!.split("#")[1]}");
    }
    return Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Card(
            elevation: 10,
            color: Color(bgColor),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${resiko.kodeBahaya}",
                        style: TextStyle(
                            color: Color(txtColor),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${resiko.kategori}",
                        style: TextStyle(
                            color: Color(txtColor),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${resiko.min} - ${resiko.max}",
                        style: TextStyle(
                            color: Color(txtColor),
                            fontWeight: FontWeight.bold),
                      ),
                    ]))));
  }

  Widget _katBahaya(Data data, context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "3. Kategori Bahaya",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${data.katBahaya}"),
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Metode Pengendalian",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${data.namaPengendalian}"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tindakanPerbaikan(Data data, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 6, 117, 10),
          padding: const EdgeInsets.all(10),
          child: const Text(
            "4. Tindakan Yang Dilakukan Untuk Perbaikan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
            elevation: 10,
            margin:
                const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(data.tindakan!)))
      ],
    );
  }

  Widget _statusPerbaikan(Data data, context) {
    var fmt = DateFormat("dd MMMM yyyy");
    var titikDua = ": ";
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Status Perbaikan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Card(
          elevation: 10,
          margin:
              const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2.5)
              },
              children: [
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Status Perbaikan"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(titikDua + data.statusPerbaikan!),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Tanggal Tenggat / Due Date"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text((data.tglTenggat != null)
                        ? titikDua +
                            fmt.format(DateTime.parse(data.tglTenggat!))
                        : "-"),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Tanggal Selesai"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text((data.tglSelesai != null)
                        ? titikDua +
                            fmt.format(DateTime.parse(data.tglSelesai!))
                        : "-"),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Jam Selesai"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text((data.jamSelesai != null)
                        ? titikDua + data.jamSelesai!
                        : "-"),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Dibuat"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(titikDua + data.namaLengkap!),
                  ),
                ]),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _gambarPerbaikan(Data data, context) {
    return Card(
      color: Colors.blue,
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.IMAGE_HAZARD_VIEW, arguments: {
                      "image": controller.updateBukti.value,
                      "loaded": true
                    });
                    // Constants().goTo(
                    //     () => ImageView(image: state.urlImg), context);
                  },
                  child: (controller.updateBukti.value != null)
                      ? CachedNetworkImage(
                          imageUrl: controller.updateBukti.value!,
                          fit: BoxFit.cover,
                          placeholder: (contex, url) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                ),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text((data.keteranganUpdate != null)
                    ? data.keteranganUpdate!
                    : "-"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _rkemSetelah(Data data, context) {
    var kemungkinan = controller.kmSesudah.value;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.orangeAccent,
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: Text(
              "Resiko Kemungkinan Sesudah",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${kemungkinan.kemungkinan}"),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text("Nilai"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("${kemungkinan.nilai}"),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Widget _rKepSesudah(Data data, context) {
    var keparahan = controller.kpSesudah.value;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: Text(
              "Resiko Keparahan Sesudah",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${keparahan.keparahan}"),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text("Nilai"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("${keparahan.nilai}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _totalResikoSesudah(Data data, context) {
    var txtColor = int.parse("0xffffffff");
    var bgColor = int.parse("0xffffffff");
    var resiko = controller.resikoSesudah.value;
    if (resiko.txtColor != null && resiko.bgColor != null) {
      txtColor = int.parse("0xff${resiko.txtColor!.split("#")[1]}");
      bgColor = int.parse("0xff${resiko.bgColor!.split("#")[1]}");
    }
    return Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 10,
          color: Color(bgColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${resiko.kodeBahaya}",
                  style: TextStyle(
                      color: Color(txtColor), fontWeight: FontWeight.bold),
                ),
                Text(
                  "${resiko.kategori}",
                  style: TextStyle(
                      color: Color(txtColor), fontWeight: FontWeight.bold),
                ),
                Text(
                  "${resiko.min} - ${resiko.max}",
                  style: TextStyle(
                      color: Color(txtColor), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _penanggungJawab(Data data, context) {
    var urlImg = "${controller.baseImage}penanggung_jawab/${data.fotoPJ}";
    var titikDua = ": ";
    return Card(
      elevation: 10,
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Card(
                color: const Color.fromARGB(147, 144, 202, 249),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.IMAGE_HAZARD_VIEW,
                            arguments: {"image": urlImg, "loaded": true});
                      },
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: urlImg,
                        placeholder: (contex, url) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Penanggung Jawab",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(2.5)
            },
            children: [
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Nama"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(titikDua + data.namaPJ!),
                ),
              ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("NIK / NRP"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(titikDua + data.nikPJ!),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  _reload(context) async {
    Constants().showAlert(
      dismiss: false,
      loading: true,
      enBtn: false,
    );
    var uid = controller.data.value.uid;
    await controller.repository.getHazardDetail(uid).then((res) {
      controller.bukti.value = "${controller.baseImage}${res?.bukti}";
      controller.updateBukti.value =
          "${controller.baseImage}update/${res?.updateBukti}";
      Get.back(result: true);
    });
  }
}
