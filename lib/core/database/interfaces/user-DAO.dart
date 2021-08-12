import 'package:list_of_lists/core/entity/user.dart';

abstract class UserDAO {
  save(User listObject);

  remove(int id);

  Future<List<User>> find();
}
