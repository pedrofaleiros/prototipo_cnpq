import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/list/article_list_view.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/material_components/home_action_button.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/search/search_widget.dart';

import '../widgets/remove_overscroll_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return RemoveOverscrollIndicator(
      child: Scaffold(
        floatingActionButton: MediaQuery.of(context).size.height > 580
            ? const HomeActionButton()
            : null,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: MediaQuery.of(context).size.height < 200
              ? Container()
              : Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 700,
                    ),
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SearchWidget(),
                        HomeDivider(),
                        ArticleListView(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class TermsWidget extends StatelessWidget {
  const TermsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              onPressed: () {},
              child: Text('data $index'),
            ),
          );
        },
      ),
    );
  }
}

Future<bool?> _showExitDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Deseja sair do app?'),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'Não',
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Sim'),
        ),
      ],
    ),
  );
}

class HomeDivider extends StatelessWidget {
  const HomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.height < 0
        ? Container()
        : const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Divider(thickness: 1),
          );
  }
}

/* 
NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => const [
                // HomeAppBar(),
              ],

 */