// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$articlesAtom =
      Atom(name: '_HomeViewModelBase.articles', context: context);

  @override
  List<ArticleModel> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(List<ArticleModel> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: '_HomeViewModelBase.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$loadArticlesAsyncAction =
      AsyncAction('_HomeViewModelBase.loadArticles', context: context);

  @override
  Future<void> loadArticles() {
    return _$loadArticlesAsyncAction.run(() => super.loadArticles());
  }

  @override
  String toString() {
    return '''
articles: ${articles},
isLoading: ${isLoading},
errorText: ${errorText}
    ''';
  }
}
