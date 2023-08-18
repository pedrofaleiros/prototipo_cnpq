import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/article_model.dart';

class SaveArticleButton extends StatelessWidget {
  const SaveArticleButton({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SavedViewModel>(context);

    return Observer(
      builder: (_) => IconButton(
        icon: controller.isFav(article.id)
            ? const Icon(Icons.bookmark)
            : const Icon(Icons.bookmark_border),
        color: Theme.of(context).colorScheme.primary,
        onPressed: () {
          controller.handle(article);
        },
      ),
    );
  }
}
