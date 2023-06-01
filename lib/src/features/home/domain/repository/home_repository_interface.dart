import 'package:prototipo_cnpq/src/features/home/data/dto/filter_dto.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';

abstract class IHomeRepository {
  Future<List<ArticleModel>?> loadArticles(FilterDto filter);
}
