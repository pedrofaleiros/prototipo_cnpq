import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onTapOutside: (_) {
      //   FocusScope.of(context).unfocus();
      // },
      onEditingComplete: () async {
        await context.read<HomeViewModel>().loadArticles().then(
              (value) => FocusScope.of(context).unfocus(),
            );
      },
      // focusNode: context.read<HomeViewModel>().focusNode,
      controller: context.read<HomeViewModel>().textController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Pesquise por artigos',
        suffixIcon: IconButton(
          onPressed: () async {
            await context
                .read<HomeViewModel>()
                .loadArticles()
                .then((value) => FocusScope.of(context).unfocus());
          },
          icon: const Icon(
            Icons.search,
            size: 28,
          ),
        ),
      ),
    );
  }
}
