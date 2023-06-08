import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

import 'item_dismissible.dart';

class SavedLisview extends StatelessWidget {
  const SavedLisview({super.key});

  @override
  Widget build(BuildContext context) {
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
