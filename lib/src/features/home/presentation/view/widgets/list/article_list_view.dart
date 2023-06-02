import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/domain/model/article_model.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/list/article_list_item.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class ArticleListView extends StatelessWidget {
  const ArticleListView({super.key});

  Widget get _loadingIndicator => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _emptyText(BuildContext context) =>
      MediaQuery.of(context).size.height > 250
          ? Center(
              child: SizedBox(
                height: 100,
                child: Image.asset(
                  'assets/imgs/logo_cnpq_completo.png',
                ),
              ),
            )
          : Container();

  Widget _lastItem(ArticleModel article) => Column(
        children: [
          ArticleListItem(
            article: article,
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/imgs/logo_cnpq_completo.png'),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeViewModel>(context);

    return Observer(
      builder: (_) => Expanded(
        child: controller.isLoading
            ? _loadingIndicator
            : controller.articles.isEmpty
                ? _emptyText(context)
                : ListView.builder(
                    itemCount: controller.articles.length,
                    itemBuilder: (_, index) =>
                        index == controller.articles.length - 1
                            ? _lastItem(controller.articles[index])
                            : ArticleListItem(
                                article: controller.articles[index],
                              ),
                  ),
      ),
    );
  }
}
