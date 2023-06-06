import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/favorites/favorite_list_view.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  static const routeName = '/saved';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        leading: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: const FavoriteListview(),
    );
  }
}
