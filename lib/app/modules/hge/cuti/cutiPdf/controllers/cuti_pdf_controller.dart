import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CutiPdfController extends GetxController {
  final provider = ProviderCuti();
  final urlPDFPath = RxnString(null);
  final judul = RxnString(null);
  final idCutiOnline = RxnString(null);
  final loaded = false.obs;
  final pdfReady = false.obs;
  final totalPages = RxnInt(1);
  final currentPage = RxnInt(1);
  final dataCuti = Data().obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final dio = Dio();
  late PDFViewController pdfViewController;
  final progress = 0.0.obs;
  final loading = false.obs;
  @override
  void onInit() async {
    dataCuti.value = await Get.arguments['data'];
    var rand = Random();
    idCutiOnline.value = dataCuti.value.idCutiOnline;
    var dari = dataCuti.value.tglMulaiCutiOnline?.replaceAll("-", "_");
    var sampai = dataCuti.value.tglSelesaiCutiOnline?.replaceAll("-", "_");
    judul.value =
        "Cuti_${dataCuti.value.namaCutiOnline?.replaceAll(" ", "_")}_${dari}_${sampai}_${rand.nextInt(999)}";
    if (judul.value != null && idCutiOnline.value != null) {
      await provider
          .getPdfCuti("${idCutiOnline.value}", "${judul.value}")
          .then((docs) async {
        urlPDFPath.value = docs.path;
        loaded.value = true;
      });
    }
    super.onInit();
  }

  deleteFile() async {
    try {
      var file = File("${urlPDFPath.value}");
      var res = await file.delete();
      print("error $res");
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
  }

  Future<bool> downloadFile(idCutiOnline) async {
    var url =
        "https://abpjobsite.com/hc/cuti/view/pdf?idCutiOnline=$idCutiOnline&saving=true";
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        if (await _reqPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          print(directory?.path);
          String newPath = "";
          List<String>? folders = directory?.path.split("/");
          for (int x = 1; x < folders!.length; x++) {
            String folder = folders[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          newPath = "$newPath/AbpEnergy/Cuti";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        directory = await getTemporaryDirectory();
      }
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File saveFile = File("${directory.path}/${judul.value}.pdf");
        await dio.download(url, saveFile.path,
            options: Options(headers: {HttpHeaders.acceptEncodingHeader: "*"}),
            onReceiveProgress: (downloaded, totalSize) {
          progress.value = downloaded / totalSize;
          print("loading ${progress.value}");
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> _reqPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
