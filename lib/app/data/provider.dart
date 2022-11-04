import 'dart:convert';

import 'package:face_id_plus/app/data/models/model_barging.dart';
import 'package:face_id_plus/app/data/models/model_crushing.dart';
import 'package:face_id_plus/app/data/models/model_driver.dart';
import 'package:face_id_plus/app/data/models/model_hauling.dart';
import 'package:face_id_plus/app/data/models/model_ob.dart';
import 'package:face_id_plus/app/data/models/model_ob_delay.dart';
import 'package:face_id_plus/app/data/models/model_pln.dart';
import 'package:face_id_plus/app/data/models/model_sarana.dart';
import 'package:face_id_plus/app/data/models/model_tugboat.dart';

import 'package:http/http.dart' as http;

import 'models/model_stock.dart';

class Provider{
  Future<ApiOB> getOB(int page, String dari, String sampai) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/ob?page=$page&dari=$dari&sampai=$sampai"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiOB.fromJson(objekJson);  
  }

  Future<ApiObDelay> getObDelay(int page, String dari, String sampai) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/obdelay?page=$page&dari=$dari&sampai=$sampai"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiObDelay.fromJson(objekJson);  
  }

  Future<ApiHauling> getHauling(int page, String dari, String sampai) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/hauling?page=$page&dari=$dari&sampai=$sampai"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiHauling.fromJson(objekJson);  
  }

  Future<ApiCrushing> getCrushing(int page, String dari, String sampai) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/crushing?page=$page&dari=$dari&sampai=$sampai"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiCrushing.fromJson(objekJson);  
  }

  Future<ApiBarging> getBarging(int page, String dari, String sampai) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/barging?page=$page&dari=$dari&sampai=$sampai"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiBarging.fromJson(objekJson);  
  }

  Future<ApiStock> getStock(int page, String dari, String sampai) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/stock?page=$page&dari=$dari&sampai=$sampai"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiStock.fromJson(objekJson);  
  }

  Future<ApiTugboat> getTugboat(int page, String dari, String sampai) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/tugboat?page=$page&dari=$dari&sampai=$sampai"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiTugboat.fromJson(objekJson);  
  }

  Future<ApiPLN> getPLN(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/monitoring/bargingpln?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiPLN.fromJson(objekJson);  
  }

  Future<ApiSarana> getSarana(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/list/sarana?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiSarana.fromJson(objekJson);  
  }

  Future<ApiDriver> getDriver(cari) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/list/driver?cari=$cari"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiDriver.fromJson(objekJson);  
  }

  Future<ApiDriver> getDriverPage(int page) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/list/driver?page=$page"); 
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiDriver.fromJson(objekJson);  
  }
}