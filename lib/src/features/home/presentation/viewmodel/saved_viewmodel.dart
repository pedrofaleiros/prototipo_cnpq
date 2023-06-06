import 'package:mobx/mobx.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_item.dart';
part 'saved_viewmodel.g.dart';

class SavedViewModel = _SavedViewModelBase with _$SavedViewModel;

abstract class _SavedViewModelBase with Store {
  @observable
  ObservableList<SavedItem> data = <SavedItem>[].asObservable();

  @computed
  List<ArticleModel> get favorites =>
      data.where((article) => article.isSaved).map((e) => e.article).toList();

  @action
  void handle(ArticleModel article) {
    final index = findById(article.id);

    if (index == -1) {
      data.add(SavedItem(article: article));
    } else {
      data[index].isSaved = !data[index].isSaved;
    }
  }

  void clearData() {
    data.removeWhere((element) => element.isSaved == false);
  }

  bool isFav(String id) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].article.id == id) {
        return data[i].isSaved;
      }
    }

    return false;
  }

  //return index or -1
  int findById(String id) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].article.id == id) {
        return i;
      }
    }
    return -1;
  }
}
