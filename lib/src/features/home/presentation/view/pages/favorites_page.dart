import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/favorites/favorite_list_view.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static const routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Favoritos'),
      ),
      body: const FavoriteListview(),
    );
  }
}
