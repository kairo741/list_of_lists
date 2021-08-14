import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/database/services/user-service.dart';
import 'package:list_of_lists/core/entity/user.dart';
import 'package:mobx/mobx.dart';

part 'user-controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  var _service = GetIt.I.get<UserService>();

  @observable
  Future<List<User>>? list;

  @action
  refreshList([dynamic param]) {
    list = _service.find();
  }

  _UserController() {
    refreshList();
  }

  Future<User> getUser() async {
    List<User> user = await _service.find();

    return user[0];
  }
}
