import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/article_model.dart';
import '../list/article_list_item.dart';

class ItemDismissible extends StatelessWidget {
  const ItemDismissible({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  Widget _background(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.errorContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete,
                // color: Colors.white.withOpacity(0.5),
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      );

  void _showSnackBar(BuildContext context, SavedViewModel controller) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        duration: const Duration(seconds: 3),
        content: Text(
          'Artigo removido',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        action: SnackBarAction(
          label: 'CANCELAR',
          onPressed: () {
            controller.handle(article);
          },
          textColor: Theme.of(context).colorScheme.error,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SavedViewModel>(context, listen: false);

    return Dismissible(
      // confirmDismiss: (direction) async => await _showDialog(context),
      direction: DismissDirection.endToStart,
      background: _background(context),
      key: Key(article.id),
      onDismissed: (_) {
        controller.handle(article);
        _showSnackBar(context, controller);
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
