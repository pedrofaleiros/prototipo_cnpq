import 'package:mobx/mobx.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
part 'favorite_viewmodel.g.dart';

class FavoriteViewModel = _FavoriteViewModelBase with _$FavoriteViewModel;

abstract class _FavoriteViewModelBase with Store {
  @observable
  ObservableList<ArticleModel> favorites = <ArticleModel>[].asObservable();

  @action
  void changeFavorite(ArticleModel article) {
    if (findById(article.id)) {
      removeFavorite(article.id);
    } else {
      addFavorite(article);
    }
  }

  void addFavorite(ArticleModel article) {
    favorites.add(article);
  }

  void removeFavorite(String id) {
    favorites.removeWhere((element) => element.id == id);
  }

  bool findById(String id) {
    for (var i in favorites) {
      if (i.id == id) {
        return true;
      }
    }

    return false;
  }
}
