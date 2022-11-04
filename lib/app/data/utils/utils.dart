import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Utils {
  Future<bool> pingVps() async {
    try {
      var uri = Uri.parse("https://api.misit.xyz/cekserver");
      http.Response api =
          await http.get(uri).timeout(const Duration(seconds: 10));
      if (kDebugMode) {
        print("ping Misit.xyz ${api.statusCode}");
      }
      if (api.statusCode < 200 || api.statusCode > 299) {
        return false;
      }
      return true;
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print("ping Misit.xyz $e");
      }
      return false;
    } on SocketException catch (e) {
      if (kDebugMode) {
        print("ping Misit.xyz $e");
      }
      return false;
    } on Error catch (e) {
      if (kDebugMode) {
        print("ping Misit.xyz $e");
      }
      return false;
    }
  }

  Future<bool> pingServer() async {
    try {
      var uri = Uri.parse("https://google.co.id");
      http.Response api =
          await http.get(uri).timeout(const Duration(seconds: 5));
      if (kDebugMode) {
        print("pingGoogle ${api.statusCode}");
      }
      if (api.statusCode < 200 || api.statusCode > 299) {
        return false;
      }
      return true;
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print("pingGoogle $e");
      }
      return false;
    } on SocketException catch (e) {
      if (kDebugMode) {
        print("pingGoogle $e");
      }
      return false;
    } on Error catch (e) {
      if (kDebugMode) {
        print("pingGoogle $e");
      }
      return false;
    }
  }

  Future<bool> pingServerLokal() async {
    try {
      var uri = Uri.parse("http://10.10.3.13/cek/server");
      http.Response api =
          await http.get(uri).timeout(const Duration(seconds: 5));
      if (kDebugMode) {
        print("pingLokal ${api.statusCode}");
      }
      if (api.statusCode < 200 || api.statusCode > 299) {
        return false;
      }
      return true;
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print("pingLokal $e");
      }
      return false;
    } on SocketException catch (e) {
      if (kDebugMode) {
        print("pingLokal $e");
      }
      return false;
    } on Error catch (e) {
      if (kDebugMode) {
        print("pingLokal $e");
      }
      return false;
    }
  }

  Future<bool> pingServerOnline() async {
    try {
      var uri = Uri.parse("https://abpjobsite.com/cek/server");
      http.Response api =
          await http.get(uri).timeout(const Duration(seconds: 5));
      if (kDebugMode) {
        print("pingStatus ${api.statusCode}");
      }
      if (api.statusCode < 200 || api.statusCode > 299) {
        return false;
      }
      return true;
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print("pingStatus $e");
      }
      return false;
    } on SocketException catch (e) {
      if (kDebugMode) {
        print("pingStatus $e");
      }
      return false;
    } on Error catch (e) {
      if (kDebugMode) {
        print("pingStatus $e");
      }
      return false;
    }
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
}

class CurrencyFormat {
  convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
