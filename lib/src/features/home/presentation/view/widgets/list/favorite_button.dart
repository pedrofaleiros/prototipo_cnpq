import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/article_model.dart';
import '../../../viewmodel/favorite_viewmodel.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FavoriteViewModel>(context);

    return Observer(
      builder: (_) => IconButton(
        icon: controller.findById(article.id)
            ? const Icon(Icons.bookmark)
            : const Icon(Icons.bookmark_border),
        color: Theme.of(context).colorScheme.primary,
        onPressed: () {
          controller.changeFavorite(article);
        },
      ),
    );
  }
}
