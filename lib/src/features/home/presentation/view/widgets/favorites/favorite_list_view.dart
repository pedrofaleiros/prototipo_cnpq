import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/favorite_viewmodel.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

import 'item_dismissible.dart';

class FavoriteListview extends StatelessWidget {
  const FavoriteListview({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<FavoriteViewModel>(context);
    final controller = Provider.of<SavedViewModel>(context);

    return Observer(
      builder: (_) => ListView.builder(
        itemCount: controller.favorites.length,
        itemBuilder: (context, index) =>
            ItemDismissible(article: controller.favorites[index]),
      ),
    );
  }
}
