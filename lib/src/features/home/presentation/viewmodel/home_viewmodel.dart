import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/filter_model.dart';
import 'package:prototipo_cnpq/src/features/home/domain/usecase/home_usecase.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/filter_viewmodel.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final HomeUsecase _usecase = HomeUsecase();

  final filter = FilterViewModel();

  TextEditingController get textController => filter.textController;

  @observable
  List<ArticleModel> articles = [];

  @observable
  bool isLoading = false;

  @observable
  String? errorText;

  @action
  Future<void> loadArticles() async {
    isLoading = true;

    final response = await _usecase.loadArticles(
      FilterModel(
        query: filter.text,
        rows: filter.rows,
        initialDate: filter.initialDate,
        finalDate: filter.finalDate,
        isPortuguese: filter.isPortuguese,
      ),
    );

    if (response == null || response.isEmpty) {
      errorText = 'Sem resultados';
    } else {
      errorText = null;
    }

    articles = response ?? [];

    isLoading = false;
  }

  ArticleModel? findById(String id) {
    for (ArticleModel a in articles) {
      if (a.id == id) {
        return a;
      }
    }

    return null;
  }
}
