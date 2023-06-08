import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/search/search_text_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
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
        : const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: SearchTextField(),
        );
  }
}
