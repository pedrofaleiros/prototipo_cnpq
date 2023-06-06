import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/search/search_icon_button.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape &&
        MediaQuery.of(context).size.height < 500) {
      return Container();
    }

    return MediaQuery.of(context).size.height < 180
        ? Container()
        : Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextField(
                onEditingComplete: () async {
                  await context.read<HomeViewModel>().loadArticles().then(
                        (value) =>
                            kIsWeb ? null : FocusScope.of(context).unfocus(),
                      );
                },
                controller: context.read<HomeViewModel>().textController,
                decoration: InputDecoration(
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Pesquise por artigos',
                  helperText: context.read<HomeViewModel>().helperText,
                  suffixIcon: const SearchIconButton(),
                ),
              ),
            ),
          );
  }
}
