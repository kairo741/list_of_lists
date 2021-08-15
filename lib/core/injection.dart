import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/database/interfaces/item-DAO.dart';
import 'package:list_of_lists/core/database/interfaces/lista-DAO.dart';
import 'package:list_of_lists/core/database/services/lista-service.dart';

import 'database/dao/item-DAO-impl.dart';
import 'database/dao/lista-DAO-impl.dart';
import 'database/dao/user-DAO-impl.dart';
import 'database/interfaces/user-DAO.dart';
import 'database/services/item-service.dart';
import 'database/services/user-service.dart';
import 'firestore/dao/item-DAO-firestore-impl.dart';
import 'firestore/dao/lista-DAO-firestore-impl.dart';
import 'firestore/dao/user-DAO-firestore-impl.dart';
import 'firestore/interfaces/item-DAO-firestore.dart';
import 'firestore/interfaces/lista-DAO-firestore.dart';
import 'firestore/interfaces/user-DAO-firestore.dart';
import 'firestore/services/item-service-firestore.dart';
import 'firestore/services/lista-service-firestore.dart';
import 'firestore/services/user-service-firestore.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;



  ///Local
  getIt.registerSingleton<UserDAO>(UserDAOImpl());
  getIt.registerSingleton<UserService>(UserService());

  ///Firebase
  getIt.registerSingleton<UserDAOFirestore>(UserDAOFirestoreImpl());
  getIt.registerSingleton<UserServiceFirestore>(UserServiceFirestore());

  ///Local
  getIt.registerSingleton<ListaDAO>(ListaDAOImpl());
  getIt.registerSingleton<ListaService>(ListaService());

  ///Firebase
  getIt.registerSingleton<ListaDAOFirestore>(ListaDAOFirestoreImpl());
  getIt.registerSingleton<ListaServiceFirestore>(ListaServiceFirestore());

  ///Local
  getIt.registerSingleton<ItemDAO>(ItemDAOImpl());
  getIt.registerSingleton<ItemService>(ItemService());

  ///Firebase
  getIt.registerSingleton<ItemDAOFirestore>(ItemDAOFirestoreImpl());
  getIt.registerSingleton<ItemServiceFirestore>(ItemServiceFirestore());
}
