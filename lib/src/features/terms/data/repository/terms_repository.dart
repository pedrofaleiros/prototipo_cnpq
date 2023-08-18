import 'package:dio/dio.dart';
import 'package:prototipo_cnpq/src/features/terms/domain/model/term_model.dart';
import 'package:prototipo_cnpq/src/features/terms/domain/repository/terms_repository_interface.dart';

class TermsRepository implements ITermsRepository {
  @override
  Future<List<TermModel>?> getTerms(String term) async {
    final dio = Dio();

    try {
      final url =
          'http://localhost:8983/solr/mesh_terms_data/select?indent=true&q.op=OR&q=ConceptName:"$term"';

      final response = await dio.get(url);

      List<TermModel> terms = [];
      List<dynamic> list = response.data['response']['docs'] as List<dynamic>;

      for (var element in list) {
        terms.add(TermModel.fromMap(element));
      }

      return terms;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
