// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemController, Store {
  final _$listAtom = Atom(name: '_ItemController.list');

  @override
  Future<List<Item>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Item>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ItemControllerActionController =
      ActionController(name: '_ItemController');

  @override
  dynamic refreshList(int idList) {
    final _$actionInfo = _$_ItemControllerActionController.startAction(
        name: '_ItemController.refreshList');
    try {
      return super.refreshList(idList);
    } finally {
      _$_ItemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
