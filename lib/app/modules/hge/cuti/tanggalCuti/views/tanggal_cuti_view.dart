import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tanggal_cuti_controller.dart';

class TanggalCutiView extends GetView<TanggalCutiController> {
  const TanggalCutiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: floatingAction(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('Pengajuan Cuti'),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              cardPenjuanCuti(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardPenjuanCuti(context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            widgetKeluarga(context),
            inputBox(controller.jenisCutiCtrl.value,
                controller.jenisCutiFocus.value, 1, "Jenis Cuti",
                readonly: true, onTap: controller.tapJenisCuti, padding: 5),
            if (controller.lapangan.value)
              inputBox(controller.tglCutiCtrl.value,
                  controller.tglCutiFocus.value, 1, "Tanggal Cuti",
                  readonly: true, onTap: controller.tapTglCuti, padding: 5),
            if (controller.jenisCuti.value)
              inputBox(controller.bukanLapanganCtrl.value,
                  controller.bukanLapanganFocus.value, 1, "Tanggal Cuti",
                  readonly: true, onTap: () async {
                _showBottomDialog(context);
              }, padding: 5),
            inputBox(controller.berangkatDariCtrl.value,
                controller.berangkatDariFocus.value, 1, "Berangkat Dari Site",
                readonly: true, onTap: () async {
              var res = await controller.selectDate(context, controller.dt);
              if (res != null) {
                controller.berangkatDariCtrl.value.text =
                    controller.fmt.format(res);
              }
            }, padding: 5),
            inputBox(controller.kembaliKeCtrl.value,
                controller.kembaliKeFocus.value, 1, "Kembali Ke Site",
                readonly: true, onTap: () async {
              var res = await controller.selectDate(context, controller.dt);
              if (res != null) {
                controller.kembaliKeCtrl.value.text =
                    controller.fmt.format(res);
              }
            }, padding: 5),
            widgetTiket(context),
          ],
        ),
      ),
    );
  }

  Widget inputBox(
      TextEditingController ctrl, FocusNode focused, int line, String label,
      {bool validate = true,
      bool enable = true,
      double? padding,
      double? elevation,
      bool? readonly = false,
      Function()? onTap,
      int? minLines}) {
    return Card(
      elevation: (elevation != null) ? elevation : 0,
      child: Padding(
        padding: EdgeInsets.all((padding != null) ? padding : 0),
        child: TextFormField(
          onTap: onTap,
          readOnly: readonly!,
          enabled: enable,
          maxLines: line,
          minLines: minLines,
          focusNode: focused,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: label),
          onSaved: (value) {
            ctrl.text = value!;
          },
          onFieldSubmitted: (term) {
            focused.unfocus();
          },
          validator: (validate)
              ? (value) {
                  if (value!.isEmpty) {
                    return '$label Wajib Di Isi';
                  }
                  return null;
                }
              : null,
          controller: ctrl,
        ),
      ),
    );
  }

  Widget widgetKeluarga(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Membawa Keluarga'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Text("Ya"),
                    Radio(
                        value: 1,
                        groupValue: controller.keluarga.value,
                        onChanged: (a) {
                          controller.keluarga.value = int.parse("$a");
                        })
                  ],
                ),
                Row(
                  children: [
                    const Text("Tidak"),
                    Radio(
                        value: 2,
                        groupValue: controller.keluarga.value,
                        onChanged: (int? a) {
                          controller.keluarga.value = int.parse("$a");
                        })
                  ],
                ),
              ],
            )
          ],
        ),
        if (controller.keluarga.value == 1)
          inputBox(
              controller.tglMembawaKeluargaCtrl.value,
              controller.tglMembawaKeluargaFocus.value,
              1,
              "Tanggal Membawa Keluarga", onTap: () async {
            DateTime? result =
                await controller.selectDate(context, controller.dt);
            if (result != null) {
              controller.tglMembawaKeluargaCtrl.value.text =
                  controller.fmt.format(result);
            }
          }, readonly: true),
      ],
    );
  }

  Widget widgetTiket(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Tiket Pesawat'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Text("Ya"),
                Radio(
                    value: 1,
                    groupValue: controller.tiketPesawat.value,
                    onChanged: (a) {
                      controller.tiketPesawat.value = int.parse("$a");
                    })
              ],
            ),
            Row(
              children: [
                const Text("Tidak"),
                Radio(
                    value: 2,
                    groupValue: controller.tiketPesawat.value,
                    onChanged: (int? a) {
                      controller.tiketPesawat.value = int.parse("$a");
                    })
              ],
            ),
          ],
        )
      ],
    );
  }

  _showBottomDialog(context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return Stack(
            children: [
              Card(
                margin: const EdgeInsets.only(top: 40),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      controller.tglPick("Dari", controller.dari.value),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.tglPick("Sampai", controller.sampai.value),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.submitWidgetDTrange()
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        customBorder: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                      )),
                ),
              )
            ],
          );
        });
  }

  Widget floatingAction() {
    return FloatingActionButton(
      onPressed: () async {
        if (controller.tiketPesawat.value == 2) {
          controller.simpanCuti();
        } else {
          controller.tiketPesawatForm();
        }
      },
      child: const Icon(Icons.queue_play_next),
    );
  }
}
