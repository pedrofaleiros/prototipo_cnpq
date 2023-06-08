import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/main_page.dart';

import '../widgets/saved/saved_list_view.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  static const routeName = '/saved';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pushReplacementNamed(
          context,
          MainPage.routeName,
        );
        return false;
      },
      child: Scaffold(
        // bottomNavigationBar: HomeBottomNavigationBar(context, 1),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          title: const Text('Favoritos'),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: const SavedLisview(),
          ),
        ),
      ),
    );
  }
}
