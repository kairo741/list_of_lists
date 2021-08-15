import 'package:list_of_lists/core/entity/user.dart';

abstract class UserDAO {
  save(User user);

  remove(int id);

  Future<List<User>> find();
}
