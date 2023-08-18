import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

Widget HomeBottomNavigationBar({
  required BuildContext context,
  required int index,
  required PageController controller,
}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 0,
          offset: Offset(0, 0), // muda a posição da sombra
        ),
      ],
    ),
    child: BottomNavigationBar(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).colorScheme.onPrimaryContainer,
      selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      unselectedItemColor:
          Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
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
    ),
  );
}
