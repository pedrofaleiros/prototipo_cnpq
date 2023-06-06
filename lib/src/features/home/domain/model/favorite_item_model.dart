import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';

class FavoriteItemModel {
  final ArticleModel article;
  bool isFav = true;

  FavoriteItemModel({required this.article});
}
