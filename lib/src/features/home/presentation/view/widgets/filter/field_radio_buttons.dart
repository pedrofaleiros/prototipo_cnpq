import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class FieldRadioButtons extends StatelessWidget {
  const FieldRadioButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Row(
        children: [
          const Text('Português'),
          Radio<bool>(
            fillColor:
                MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
            value: true,
            groupValue: context.read<HomeViewModel>().filter.isPortuguese,
            onChanged: (value) {
              if (value == null) return;
              context.read<HomeViewModel>().filter.changeFieldLang(value);
            },
          ),
          Expanded(child: Container()),
          const Text('Inglês'),
          Radio<bool>(
            fillColor:
                MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
            value: false,
            groupValue: context.read<HomeViewModel>().filter.isPortuguese,
            onChanged: (value) {
              if (value == null) return;
              context.read<HomeViewModel>().filter.changeFieldLang(value);
            },
          ),
        ],
      ),
    );
  }
}
