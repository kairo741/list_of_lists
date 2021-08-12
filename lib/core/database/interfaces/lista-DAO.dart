import 'package:list_of_lists/core/entity/lista.dart';

abstract class ListaDAO {
  save(Lista listObject);

  remove(int id);

  Future<List<Lista>> find();
}
