import 'package:get/get.dart';

import '../models/cek_login_model.dart';

class CekLoginProvider extends GetConnect {
  Future<CekLogin?> getCekLogin(int id) async {
    final response = await get('ceklogin/$id');
    return response.body;
  }

  Future<Response<CekLogin>> postCekLogin(CekLogin ceklogin) async =>
      await post('ceklogin', ceklogin);

      
  Future<Response> deleteCekLogin(int id) async => await delete('ceklogin/$id');
  
}
