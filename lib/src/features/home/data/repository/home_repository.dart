import 'package:prototipo_cnpq/src/features/home/data/dto/filter_dto.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/domain/utils/url_generator.dart';

import '../../domain/repository/home_repository_interface.dart';

import 'package:dio/dio.dart';

class HomeRepositoryDio implements IHomeRepository {
  late final Dio _dioClient;

  HomeRepositoryDio() {
    _dioClient = getDio();
  }

  @override
  Future<List<ArticleModel>?> loadArticles(FilterDto filter) async {
    final url = UrlGenerator.getUrl(filter);

    try {
      final response = await _dioClient.get(url);

      List<ArticleModel> articles = [];
      List<dynamic> data = response.data['response']['docs'] as List<dynamic>;

      for (var element in data) {
        articles.add(
          ArticleModel.fromMap(element),
        );
      }

      return articles;
    } catch (e) {
      print('erro: ${e.toString()}');
      return null;
    }
  }
}

Dio getDio() {
  Dio dio = Dio();

  dio.options.sendTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 5);
  dio.options.connectTimeout = const Duration(seconds: 5);

  return dio;
}

List<ArticleModel> mockData = [
  ArticleModel(
      id: '10001',
      titulo: 'Inteligência Artificial na Área Médica: O Futuro da Saúde',
      tituloEn: 'Artificial Intelligence in Healthcare: The Future of Medicine',
      anoProducao: 2021,
      url: 'https://www.google.com'),
  ArticleModel(
      id: '10002',
      titulo: 'A Revolução Blockchain: Transformando Indústrias e Transações',
      tituloEn:
          'The Blockchain Revolution: Transforming Industries and Transactions',
      anoProducao: 2022,
      url: 'https://www.google.com'),
  ArticleModel(
      id: '10003',
      titulo: 'A Importância da Energia Renovável para um Futuro Sustentável',
      anoProducao: 2020,
      url: 'https://www.google.com'),
  ArticleModel(
      id: '10004',
      titulo: 'A Evolução dos Carros Elétricos: Rumo à Mobilidade Sustentável',
      anoProducao: 2023,
      url: 'https://www.google.com'),
  ArticleModel(
      id: '10005',
      tituloEn: 'Sustainable Development: A Better Future for Our Planet',
      anoProducao: 2021,
      url: 'https://www.google.com'),
];
