import 'package:prototipo_cnpq/src/features/terms/domain/model/term_model.dart';

abstract class ITermsRepository {
  Future<List<TermModel>?> getTerms(String term);
}
