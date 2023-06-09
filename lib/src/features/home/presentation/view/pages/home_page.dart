import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/list/article_list_view.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/search/search_widget.dart';

import '../widgets/filter/filters_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  Future<void> _showFiltersDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) => const FiltersDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final res = await _showExitDialog(context);

        if (res == null) return false;

        return res;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const GovLogo(),
          actions: [
            IconButton(
              onPressed: () async => await _showFiltersDialog(context),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: MediaQuery.of(context).size.height < 200
            ? Container()
            : Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SearchWidget(),
                      HomeDivider(),
                      ArticleListView(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

Future<bool?> _showExitDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Deseja sair do app?'),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'Não',
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Sim'),
        ),
      ],
    ),
  );
}

class GovLogo extends StatelessWidget {
  const GovLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Image.asset('assets/imgs/logo_gov.png'),
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
