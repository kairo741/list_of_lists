import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/core/firestore/interfaces/lista-DAO-firestore.dart';
import 'package:list_of_lists/core/utils/constants.dart';

class ListaDAOFirestoreImpl implements ListaDAOFirestore {
  CollectionReference? listaCollection;

  ListaDAOFirestoreImpl() {
    listaCollection =
        FirebaseFirestore.instance.collection(Constants.TABLE_LISTA);
  }

  @override
  Future<List<Lista>> find() async {
    var result = await listaCollection!.get();

    return result.docs
        .map((e) => Lista(
              id: int.parse(e.reference.id),
              name: e[Lista.NAME],
              icon: e[Lista.ICON],
              idUser: e[Lista.ID_USER],
              status: e[Lista.STATUS],
              createDate: e[Lista.CREATE_DATE],
            ))
        .toList();
  }

  @override
  remove(int id) {
    listaCollection!.doc(id.toString()).delete();
  }

  @override
  save(Lista lista) {
    var id = lista.id != null ? lista.id.toString() : null;

    listaCollection!.doc(id).set({
      Lista.NAME: lista.name,
      Lista.ICON: lista.icon,
      Lista.ID_USER: lista.idUser,
      Lista.STATUS: lista.status,
      Lista.CREATE_DATE: lista.createDate,
    });
  }
}
