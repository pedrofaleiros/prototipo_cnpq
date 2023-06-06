import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/saved_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/list/article_list_view.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/search/search_text_field.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

import '../widgets/filter/filters_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';

  Future<void> _showDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) => const FiltersDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: SizedBox(
          height: 40,
          child: Image.asset('assets/imgs/logo_gov.png'),
        ),
        actions: [
          IconButton(
            onPressed: () async => await _showDialog(context),
            // icon: const Icon(Icons.tune),
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              context.read<SavedViewModel>().clearData();
              Navigator.of(context).pushNamed(SavedPage.routeName);
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SearchTextField(),
              HomeDivider(),
              ArticleListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDivider extends StatelessWidget {
  const HomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.height < 0
        ? Container()
        : const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Divider(thickness: 1),
          );
  }
}
