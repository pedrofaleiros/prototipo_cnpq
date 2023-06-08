// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilterViewModel on _FilterViewModelBase, Store {
  late final _$rowsAtom =
      Atom(name: '_FilterViewModelBase.rows', context: context);

  @override
  int get rows {
    _$rowsAtom.reportRead();
    return super.rows;
  }

  @override
  set rows(int value) {
    _$rowsAtom.reportWrite(value, super.rows, () {
      super.rows = value;
    });
  }

  late final _$initialDateAtom =
      Atom(name: '_FilterViewModelBase.initialDate', context: context);

  @override
  int? get initialDate {
    _$initialDateAtom.reportRead();
    return super.initialDate;
  }

  @override
  set initialDate(int? value) {
    _$initialDateAtom.reportWrite(value, super.initialDate, () {
      super.initialDate = value;
    });
  }

  late final _$finalDateAtom =
      Atom(name: '_FilterViewModelBase.finalDate', context: context);

  @override
  int? get finalDate {
    _$finalDateAtom.reportRead();
    return super.finalDate;
  }

  @override
  set finalDate(int? value) {
    _$finalDateAtom.reportWrite(value, super.finalDate, () {
      super.finalDate = value;
    });
  }

  late final _$isPortugueseAtom =
      Atom(name: '_FilterViewModelBase.isPortuguese', context: context);

  @override
  bool get isPortuguese {
    _$isPortugueseAtom.reportRead();
    return super.isPortuguese;
  }

  @override
  set isPortuguese(bool value) {
    _$isPortugueseAtom.reportWrite(value, super.isPortuguese, () {
      super.isPortuguese = value;
    });
  }

  late final _$_FilterViewModelBaseActionController =
      ActionController(name: '_FilterViewModelBase', context: context);

  @override
  void setRows(int? value) {
    final _$actionInfo = _$_FilterViewModelBaseActionController.startAction(
        name: '_FilterViewModelBase.setRows');
    try {
      return super.setRows(value);
    } finally {
      _$_FilterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInitialDate(int? value) {
    final _$actionInfo = _$_FilterViewModelBaseActionController.startAction(
        name: '_FilterViewModelBase.setInitialDate');
    try {
      return super.setInitialDate(value);
    } finally {
      _$_FilterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFinalDate(int? value) {
    final _$actionInfo = _$_FilterViewModelBaseActionController.startAction(
        name: '_FilterViewModelBase.setFinalDate');
    try {
      return super.setFinalDate(value);
    } finally {
      _$_FilterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFieldLang(bool value) {
    final _$actionInfo = _$_FilterViewModelBaseActionController.startAction(
        name: '_FilterViewModelBase.changeFieldLang');
    try {
      return super.changeFieldLang(value);
    } finally {
      _$_FilterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rows: ${rows},
initialDate: ${initialDate},
finalDate: ${finalDate},
isPortuguese: ${isPortuguese}
    ''';
  }
}
