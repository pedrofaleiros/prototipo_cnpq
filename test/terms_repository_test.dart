import 'package:prototipo_cnpq/src/features/terms/data/repository/terms_repository.dart';
import 'package:test/test.dart';

void main() async {
  test('TermsRepository Test', () async {
    final repo = TermsRepository();

    final response = await repo.getTerms('neoplasm');

    if (response != null) {
      for (var element in response) {
        print('${element.name}: ${element.terms}');
      }
    }
  });
}
