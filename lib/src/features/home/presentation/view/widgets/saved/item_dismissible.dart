import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/show_snack_bar.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/article_model.dart';
import '../list/article_list_item.dart';
import 'dismiss_background.dart';

class ItemDismissible extends StatelessWidget {
  const ItemDismissible({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SavedViewModel>(context, listen: false);

    return Dismissible(
      // confirmDismiss: (direction) async => await _showDialog(context),
      direction: DismissDirection.endToStart,
      background: const DismissBackground(),
      key: Key(article.id),
      onDismissed: (_) {
        controller.handle(article);
        showSnackBar(
          context: context,
          controller: controller,
          article: article,
        );
      },
      child: ArticleListItem(
        isFav: true,
        article: article,
      ),
    );
  }
}

Future<bool?> _showDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Deseja remover o artigo?'),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'Cancelar',
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Sim'),
        ),
      ],
    ),
  );
}
