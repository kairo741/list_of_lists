// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserController, Store {
  final _$listAtom = Atom(name: '_UserController.list');

  @override
  Future<List<User>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<User>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_UserControllerActionController =
      ActionController(name: '_UserController');

  @override
  dynamic refreshList([dynamic param]) {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.refreshList');
    try {
      return super.refreshList(param);
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
