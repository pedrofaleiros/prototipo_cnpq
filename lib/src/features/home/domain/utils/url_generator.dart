import 'package:prototipo_cnpq/src/features/home/data/dto/filter_dto.dart';

class UrlGenerator {
  static const _baseUrl =
      'http://192.168.0.122:8983/solr/prod_cientifica_teste_novo/';

  static String getUrl(FilterDto filter) {
    var url = '${_baseUrl}select?indent=true&q.op=OR';
    url +=
        '&q=${filter.query} AND ano_producao:[${filter.initialDate} TO ${filter.finalDate}]&rows=${filter.rows}';

    return url;
  }
}
