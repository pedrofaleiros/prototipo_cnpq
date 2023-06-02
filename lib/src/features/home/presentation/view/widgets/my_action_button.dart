import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/favorites_page.dart';

class MyActionButton extends StatelessWidget {
  const MyActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(FavoritesPage.routeName);
      },
      // onPressed: () {
      //   final focusNode = context.read<HomeViewModel>().focusNode;

      //   if (focusNode.hasFocus) {
      //     context.read<HomeViewModel>().loadArticles().then(
      //           (value) => FocusScope.of(context).unfocus(),
      //         );
      //   } else {
      //     FocusScope.of(context).requestFocus(focusNode);
      //   }
      // },
      child: const Icon(Icons.favorite),
    );
  }
}
