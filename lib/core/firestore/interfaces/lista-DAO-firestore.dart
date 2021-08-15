import 'package:list_of_lists/core/entity/lista.dart';

abstract class ListaDAOFirestore {
  save(Lista lista);

  remove(int id);

  Future<List<Lista>> find();
}
