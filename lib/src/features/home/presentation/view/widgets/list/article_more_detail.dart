import 'package:flutter/material.dart';

import '../../../../domain/model/article_model.dart';

class ArticleMoreDetail extends StatelessWidget {
  const ArticleMoreDetail({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  Widget? get _title => article.titulo == null
      ? null
      : article.tituloEn == null
          ? null
          : Text(
              article.tituloEn!,
            );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: _title,
        subtitle: article.url == null
            ? null
            : Text(
                '${article.url}',
              ),
      ),
    );
  }
}
