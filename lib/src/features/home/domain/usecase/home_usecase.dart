import 'package:prototipo_cnpq/src/features/home/data/dto/filter_dto.dart';
import 'package:prototipo_cnpq/src/features/home/data/repository/home_repository.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/filter_model.dart';
import 'package:prototipo_cnpq/src/features/home/domain/repository/home_repository_interface.dart';
import 'package:prototipo_cnpq/src/features/home/domain/utils/filter_validator.dart';

class HomeUsecase {
  late final IHomeRepository repository;
  late final FilterValidator validator;

  HomeUsecase() {
    repository = HomeRepositoryDio();
    validator = FilterValidator();
  }

  Future<List<ArticleModel>?> loadArticles(FilterModel filter) async {
    if (!validator.validateText(filter.query)) {
      return null;
    }

    final response = await repository.loadArticles(
      FilterDto(
        query: validator.getQuery(filter.query, filter.isPortuguese),
        rows: validator.getRows(filter.rows),
        initialDate: validator.getInitialDate(filter.initialDate),
        finalDate: validator.getFinalDate(filter.finalDate),
      ),
    );

    return response;
  }
}
