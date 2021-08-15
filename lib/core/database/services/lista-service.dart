import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/database/interfaces/lista-DAO.dart';
import 'package:list_of_lists/core/entity/lista.dart';

class ListaService {
  var _dao = GetIt.I.get<ListaDAO>();

  save(Lista lista) async {
    validate(lista);
    await _dao.save(lista);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Lista>> find() {
    return _dao.find();
  }

  validate(Lista lista) {
    if (lista.name == null) {
      throw new Exception("O nome é obrigatório!");
    }
  }
}
