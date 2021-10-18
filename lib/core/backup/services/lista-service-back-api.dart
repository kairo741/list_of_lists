import 'package:list_of_lists/core/entity/Info.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/core/utils/dio/dio-config.dart';

class ListaServiceApiBack {
  save(Lista lista) async {
    String path = Constants.SAVE_LISTA_PATH;
    var json = lista.toJson();
    var dio = await DioConfig.builderConfig();
    var response = await dio.post(path, data: json);
    Info result = Info.fromJson(response.data);
  }
}
