import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/saved_page.dart';

class MyActionButton extends StatelessWidget {
  const MyActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(SavedPage.routeName);
      },
      child: const Icon(Icons.favorite),
    );
  }
}
