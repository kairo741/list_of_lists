

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

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ItemDAO>(ItemDAOImpl());

  getIt.registerSingleton<ItemService>(ItemService());

  getIt.registerSingleton<ListaDAO>(ListaDAOImpl());
  getIt.registerSingleton<ListaService>(ListaService());

  getIt.registerSingleton<UserDAO>(UserDAOImpl());
  getIt.registerSingleton<UserService>(UserService());

}