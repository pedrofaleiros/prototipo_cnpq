import 'package:flutter/material.dart';

import '../../../../domain/model/article_model.dart';
import '../../../viewmodel/saved_viewmodel.dart';

void showSnackBar({
  required BuildContext context,
  required SavedViewModel controller,
  required ArticleModel article,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    _getSnackBar(
      context: context,
      controller: controller,
      article: article,
    ),
  );
}

SnackBar _getSnackBar({
  required BuildContext context,
  required SavedViewModel controller,
  required ArticleModel article,
}) =>
    SnackBar(
      width: MediaQuery.of(context).size.width > 700 ? 700 - 32 : null,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      content: Text(
        'Artigo removido dos salvos',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.w600,
          fontFamily: 'rawline',
        ),
      ),
      action: _cancelButton(
        context: context,
        controller: controller,
        article: article,
      ),
    );

SnackBarAction _cancelButton({
  required BuildContext context,
  required SavedViewModel controller,
  required ArticleModel article,
}) =>
    SnackBarAction(
      label: 'CANCELAR',
      onPressed: () {
        controller.handle(article);
      },
      textColor: Theme.of(context).colorScheme.primary,
    );
