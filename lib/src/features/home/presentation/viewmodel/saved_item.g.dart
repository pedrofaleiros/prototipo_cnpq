// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SavedItem on _SavedItemBase, Store {
  late final _$isSavedAtom =
      Atom(name: '_SavedItemBase.isSaved', context: context);

  @override
  bool get isSaved {
    _$isSavedAtom.reportRead();
    return super.isSaved;
  }

  @override
  set isSaved(bool value) {
    _$isSavedAtom.reportWrite(value, super.isSaved, () {
      super.isSaved = value;
    });
  }

  late final _$_SavedItemBaseActionController =
      ActionController(name: '_SavedItemBase', context: context);

  @override
  void changeSaved() {
    final _$actionInfo = _$_SavedItemBaseActionController.startAction(
        name: '_SavedItemBase.changeSaved');
    try {
      return super.changeSaved();
    } finally {
      _$_SavedItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSaved: ${isSaved}
    ''';
  }
}
