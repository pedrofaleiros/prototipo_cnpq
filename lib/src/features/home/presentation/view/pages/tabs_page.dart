import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/home_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/saved_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/gov_logo.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  static const routeName = '/tab-page';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getAppBar(context),
        body: const TabBarView(
          children: [
            HomePage(),
            SavedPage(),
          ],
        ),
      ),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      title: const GovLogo(),
      backgroundColor: Theme.of(context).colorScheme.background,
      bottom: TabBar(
        labelColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.onBackground
            : Theme.of(context).colorScheme.onPrimaryContainer,
        indicatorColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.onBackground
            : Theme.of(context).colorScheme.onPrimaryContainer,
        unselectedLabelColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.onBackground
            : Theme.of(context).colorScheme.onPrimaryContainer,
        tabs: const [
          Tab(icon: Icon(Icons.search)),
          Tab(icon: Icon(Icons.bookmark)),
        ],
      ),
    );
  }
}
