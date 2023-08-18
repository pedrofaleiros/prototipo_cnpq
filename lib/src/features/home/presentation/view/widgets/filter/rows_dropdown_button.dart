import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/home_viewmodel.dart';

class RowsDropdownButton extends StatelessWidget {
  const RowsDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'N° de resultados:',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Expanded(child: Container()),
          Observer(
            builder: (_) => DropdownButton<int>(
              value: context.read<HomeViewModel>().filter.rows,
              items: const [
                DropdownMenuItem(
                  value: 10,
                  child: DropdownContent(text: '10'),
                ),
                DropdownMenuItem(
                  value: 25,
                  child: DropdownContent(text: '25'),
                ),
                DropdownMenuItem(
                  value: 50,
                  child: DropdownContent(text: '50'),
                ),
                DropdownMenuItem(
                  value: 100,
                  child: DropdownContent(text: '100'),
                ),
              ],
              onChanged: (int? num) {
                context.read<HomeViewModel>().filter.setRows(num);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownContent extends StatelessWidget {
  const DropdownContent({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(text),
    );
  }
}
