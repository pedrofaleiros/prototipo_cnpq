import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class FieldRadioButtons extends StatelessWidget {
  const FieldRadioButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Buscar em',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              'Português',
              style: TextStyle(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            Radio<bool>(
              fillColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary),
              value: true,
              groupValue: context.read<HomeViewModel>().filter.isPortuguese,
              onChanged: (value) {
                if (value == null) return;
                context.read<HomeViewModel>().filter.changeFieldLang(value);
              },
            ),
            const SizedBox(width: 20),
            Text(
              'Inglês',
              style: TextStyle(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            Radio<bool>(
              fillColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary),
              value: false,
              groupValue: context.read<HomeViewModel>().filter.isPortuguese,
              onChanged: (value) {
                if (value == null) return;
                context.read<HomeViewModel>().filter.changeFieldLang(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
