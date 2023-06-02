// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteViewModel on _FavoriteViewModelBase, Store {
  late final _$favoritesAtom =
      Atom(name: '_FavoriteViewModelBase.favorites', context: context);

  @override
  ObservableList<ArticleModel> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<ArticleModel> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$_FavoriteViewModelBaseActionController =
      ActionController(name: '_FavoriteViewModelBase', context: context);

  @override
  void changeFavorite(ArticleModel article) {
    final _$actionInfo = _$_FavoriteViewModelBaseActionController.startAction(
        name: '_FavoriteViewModelBase.changeFavorite');
    try {
      return super.changeFavorite(article);
    } finally {
      _$_FavoriteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
