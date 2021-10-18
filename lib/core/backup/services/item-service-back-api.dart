import 'package:list_of_lists/core/entity/Info.dart';
import 'package:list_of_lists/core/entity/item.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/core/utils/dio/dio-config.dart';

class ItemServiceApiBack {
  save(Item item) async {
    String path = Constants.SAVE_ITEM_PATH;
    // if (item.base64photo != null && item.base64photo!.length > 10000) {
    //   item.base64photo = null;
    // }
    var json = item.toJson();
    var dio = await DioConfig.builderConfig();
    var response = await dio.post(path, data: json);
    Info result = Info.fromJson(response.data);
  }
}
