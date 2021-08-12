
import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/database/interfaces/user-DAO.dart';
import 'package:list_of_lists/core/entity/user.dart';

class UserService{

  var _dao = GetIt.I.get<UserDAO>();


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