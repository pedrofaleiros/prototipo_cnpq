import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/list/article_list_item.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/favorite_viewmodel.dart';
import 'package:provider/provider.dart';

class FavoriteListview extends StatelessWidget {
  const FavoriteListview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FavoriteViewModel>(context);

    return Observer(
      builder: (_) => ListView.builder(
        itemCount: controller.favorites.length,
        itemBuilder: (context, index) => ArticleListItem(
          article: controller.favorites[index],
        ),
      ),
    );
  }
}
