import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/home_viewmodel.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        FocusScope.of(context).unfocus();
        await context.read<HomeViewModel>().loadArticles();
      },
      icon: const Icon(
        Icons.search,
        size: 32,
      ),
    );
  }
}
