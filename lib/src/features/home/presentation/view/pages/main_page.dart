import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/home_bottom_navigation_bar.dart';

import 'home_page.dart';
import 'saved_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const <Widget>[
          HomePage(),
          SavedPage(),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        context: context,
        index: _currentIndex,
        controller: _pageController,
      ),
    );
  }
}
