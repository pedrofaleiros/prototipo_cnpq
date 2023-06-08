import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

BottomNavigationBar HomeBottomNavigationBar({
  required BuildContext context,
  required int index,
  required PageController controller,
}) {
  return BottomNavigationBar(
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    selectedItemColor: Theme.of(context).colorScheme.background,
    unselectedItemColor:
        Theme.of(context).colorScheme.onTertiary.withOpacity(0.8),
    currentIndex: index,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Buscar',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark),
        label: 'Salvos',
      ),
    ],
    onTap: (index) {
      if (index == 0) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      } else if (index == 1) {
        context.read<SavedViewModel>().clearData();
      }

      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    },
  );
}
