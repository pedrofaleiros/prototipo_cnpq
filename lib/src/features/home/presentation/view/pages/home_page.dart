import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/article_list_view.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/search_text_field.dart';

import '../widgets/filters_dialog.dart';
import '../widgets/rows_dropdown_button.dart';

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
        title: const Text(
          'Home Page',
        ),
        actions: [
          IconButton(
            onPressed: () async => await _showDialog(context),
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            SearchTextField(),
            Divider(thickness: 1),
            ArticleListView(),
          ],
        ),
      ),
    );
  }
}
