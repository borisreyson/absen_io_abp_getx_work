import 'package:face_id_plus/app/data/utils/make_pdf.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:printing/printing.dart';

class P2hPdfView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P2hPdfView'),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }
}
