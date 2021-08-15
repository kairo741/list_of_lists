import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/core/firestore/interfaces/lista-DAO-firestore.dart';

class ListaServiceFirestore {
  var _dao = GetIt.I.get<ListaDAOFirestore>();

  save(Lista lista) {
    _dao.save(lista);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Lista>> find() {
    return _dao.find();
  }
}
