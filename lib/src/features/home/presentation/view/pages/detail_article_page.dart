import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailArticlePage extends StatelessWidget {
  const DetailArticlePage({super.key});

  static const routeName = '/detail-article';

  @override
  Widget build(BuildContext context) {
    final articleId = ModalRoute.of(context)!.settings.arguments as String;

    final ArticleModel? aux = context.read<HomeViewModel>().findById(articleId);

    late final ArticleModel article;

    if (aux == null) {
      article = ArticleModel(id: 'null');
      Navigator.of(context).pop();
    } else {
      article = aux;
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(article.titulo ?? article.tituloEn!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(article.id),
          Text('${article.titulo}'),
          Text('${article.tituloEn}'),
          Text('${article.url}'),
          Text('${article.anoProducao}'),
        ],
      ),
    );
  }
}
