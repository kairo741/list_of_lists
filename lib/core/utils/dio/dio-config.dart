import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:list_of_lists/core/utils/constants.dart';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
// import 'package:interfit_app/core/model/jwt-obj.dart';

// const API_TOKEN = 'Admin';

// final storage = new Storage.FlutterSecureStorage();

class DioConfig {
  static Future<Dio> builderConfig({findToken: false}) async {
    var dio = Dio(BaseOptions(
        baseUrl: '${Constants.SERVER_IP}',
        receiveDataWhenStatusError: true,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000));
    if (Platform.isAndroid) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    // if (findToken) {
    //   var token = await _jwtOrEmpty(); // recupero o token
    //   if (token == null) {
    //     // token = await getToken(dio); // busco o token na api
    //   }
    //   // Seto o token no header
    //   dio.options.headers["Authorization"] =
    //       token!.tokenType + " " + token.accessToken;
    // }

    return dio;
  }

  /// Busco o token na api
// static Future<JwtObj?> getToken(Dio dio) async {
//   debugPrint("getToken");
//   final Response response = await dio.post(Constantes.GET_TOKEN_PATH,
//       options: Options(headers: {'apiToken': '$API_TOKEN'}));
//
//   var info = Info.fromJson( response.data);
//   if (info.success == true) {
//     var jwt = JwtObj.fromJson(info.object as Map<String, Object?>);
//     await storage.write(key: 'jwt', value: json.encode(jwt));
//     return jwt;
//   } else {
//     throw new Exception("Erro ao recuperar o token de acesso!");
//   }
// }

  /// Recupero o token salvo
// static Future<JwtObj?> _jwtOrEmpty() async {
//   var jwtStr = await storage.read(key: "jwt");
//   if (jwtStr == null) return null;
//   var jwt = JwtObj.fromJson(jsonDecode(jwtStr));
//   var now = DateTime.now();
//   var expiresIn =
//       DateTime.fromMillisecondsSinceEpoch(jwt.expiresIn * 1000, isUtc: false);
//
//   if (now.isAfter(expiresIn)) {
//     // Verifico se o token está expirado
//     return null;
//   }
//   return jwt;
// }
//
// static removeJwt() async {
//   await storage.delete(key: "jwt");
// }
}
