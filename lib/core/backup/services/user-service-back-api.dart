import 'package:list_of_lists/core/entity/Info.dart';
import 'package:list_of_lists/core/entity/user.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/core/utils/dio/dio-config.dart';

class UserServiceApiBack {
  save(User user) async {
    validate(user);
    String path = Constants.SAVE_USER_PATH;
    var json = user.toJson();
    var dio = await DioConfig.builderConfig();
    var response = await dio.post(path, data: json);
    Info result = Info.fromJson(response.data);
  }

  remove(int id) {
    // _dao.remove(id);
  }

  // Future<List<User>> find() {
  //   return _dao.find();
  // }

  validate(User user) {
    if (user.name == null) {
      throw new Exception("O nome é obrigatório!");
    }
  }
}
