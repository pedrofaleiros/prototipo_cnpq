import 'package:flutter/material.dart';

import '../widgets/saved/saved_list_view.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  static const routeName = '/saved';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          title: const Text('Favoritos'),
          leading: IconButton(
            onPressed: () async {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();

              Future.delayed(const Duration(milliseconds: 150)).then(
                (_) => Navigator.of(context).pop(),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
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
