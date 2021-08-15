import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_of_lists/core/database/interfaces/user-DAO.dart';
import 'package:list_of_lists/core/entity/user.dart';
import 'package:list_of_lists/core/utils/constants.dart';

class UserDAOFirestore implements UserDAO {
  CollectionReference? userCollection;

  UserDAOFirestore() {
    userCollection =
        FirebaseFirestore.instance.collection(Constants.TABLE_USER);
  }

  @override
  Future<List<User>> find() async {
    var result = await userCollection!.get();
    return result.docs
        .map((e) => User(
              id: int.parse(e.reference.id),
              name: e[User.NAME],
              status: e[User.STATUS],
              createDate: e[User.CREATE_DATE],
            ))
        .toList();
  }

  @override
  remove(int id) {
    userCollection!.doc(id.toString()).delete();
  }

  @override
  save(User user) {
    var id = user.id != null ? user.id.toString() : null;
    userCollection!.doc(id).set({
      User.NAME: user.name,
      User.STATUS: user.status,
      User.CREATE_DATE: user.createDate,
    });
  }
}
