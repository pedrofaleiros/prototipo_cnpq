import 'package:mobx/mobx.dart';

import '../../domain/model/article_model.dart';
part 'generated/saved_item.g.dart';

class SavedItem = _SavedItemBase with _$SavedItem;

abstract class _SavedItemBase with Store {
  final ArticleModel article;

  @observable
  bool isSaved = true;

  @action
  void changeSaved() {
    isSaved = !isSaved;
  }

  _SavedItemBase({required this.article});
}
