import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/gov_logo.dart';

import '../filter/filters_dialog.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });
  Future<void> _showFiltersDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) => const FiltersDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      forceElevated: true,
      foregroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.background,
      title: const GovLogo(),
      // actions: [
      //   IconButton(
      //     onPressed: () async => await _showFiltersDialog(context),
      //     icon: const Icon(Icons.settings),
      //   ),
      // ],
    );
  }
}
