// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SavedViewModel on _SavedViewModelBase, Store {
  Computed<List<ArticleModel>>? _$favoritesComputed;

  @override
  List<ArticleModel> get favorites => (_$favoritesComputed ??=
          Computed<List<ArticleModel>>(() => super.favorites,
              name: '_SavedViewModelBase.favorites'))
      .value;

  late final _$dataAtom =
      Atom(name: '_SavedViewModelBase.data', context: context);

  @override
  ObservableList<SavedItem> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<SavedItem> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$_SavedViewModelBaseActionController =
      ActionController(name: '_SavedViewModelBase', context: context);

  @override
  void handle(ArticleModel article) {
    final _$actionInfo = _$_SavedViewModelBaseActionController.startAction(
        name: '_SavedViewModelBase.handle');
    try {
      return super.handle(article);
    } finally {
      _$_SavedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
favorites: ${favorites}
    ''';
  }
}
