import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/search/search_icon_button.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/home_viewmodel.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextField(
        onEditingComplete: () async {
          await context.read<HomeViewModel>().loadArticles().then(
                (value) => kIsWeb ? null : FocusScope.of(context).unfocus(),
              );
        },
        controller: context.read<HomeViewModel>().textController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.25),
            ),
          ),
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          border: const OutlineInputBorder(),
          labelText: 'Pesquise por artigos',
          helperText: context.read<HomeViewModel>().errorText,
          suffixIcon: const SearchIconButton(),
        ),
      ),
    );
  }
}
