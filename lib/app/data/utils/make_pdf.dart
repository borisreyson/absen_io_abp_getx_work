// ignore_for_file: depend_on_referenced_packages

import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf() async {
  final pdf = Document();
  final image1 = MemoryImage(
    (await rootBundle.load('assets/icon.png')).buffer.asUint8List(),
  );
  pdf.addPage(
   Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) {
      return Column(
        children: [
          Row(
            children: [
              Image(image1, width: 80),
              Text("PT. ALAMJAYA BARA PRATAMA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
            ]
          ),
          Text("DAFTAR PEMERIKSAAN PERALATAN HARIAN (P2H)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topContent1(),
              topContent2(),
            ],
          ),
        ]
      );
    }
   ), 
  );
  return pdf.save();
}

Widget topContent1() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jenis Peralatan : Sarana Ringan "),
        Text("Kode Unit          : HILLUX "),
        Text("No Pol / Lamb   : DA 1234 BB "),
        Text("Tanggal             : 28 Juni 2022 "),
      ]
    ),
  );
}

Widget topContent2() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shift                 : 2"),
        Text("HM / KM Awal : 23990 "),
        Text("HM / KM Akhir : 45990"),
        Text("Departemen    : HCGA"),
      ]
    ),
  );
}