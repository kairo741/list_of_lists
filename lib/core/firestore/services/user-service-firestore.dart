
import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/entity/user.dart';
import 'package:list_of_lists/core/firestore/interfaces/user-DAO-firestore.dart';

class UserServiceFirestore{

  var _dao = GetIt.I.get<UserDAOFirestore>();


  save(User user){
    validate(user);
    _dao.save(user);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<User>>find(){
    return _dao.find();
  }


  validate(User user){
    if(user.name == null){
      throw new Exception("O nome é obrigatório!");
    }
  }


}