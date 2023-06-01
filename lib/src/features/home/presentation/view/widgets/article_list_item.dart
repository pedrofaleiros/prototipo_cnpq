import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/detail_article_page.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailArticlePage.routeName,
          arguments: article.id,
        );
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              article.titulo ?? article.tituloEn!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: article.titulo == null
                ? null
                : article.tituloEn == null
                    ? null
                    : Text(
                        article.tituloEn!,
                      ),
            trailing: Text(
              article.anoProducao.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
