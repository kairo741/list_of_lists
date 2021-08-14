// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaController on _ListaController, Store {
  final _$listAtom = Atom(name: '_ListaController.list');

  @override
  Future<List<Lista>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Lista>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ListaControllerActionController =
      ActionController(name: '_ListaController');

  @override
  dynamic refreshList([dynamic param]) {
    final _$actionInfo = _$_ListaControllerActionController.startAction(
        name: '_ListaController.refreshList');
    try {
      return super.refreshList(param);
    } finally {
      _$_ListaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
