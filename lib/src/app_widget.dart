import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/detail_article_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/favorites_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/home_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/favorite_viewmodel.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';

import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => HomeViewModel(),
        ),
        Provider(
          create: (_) => FavoriteViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'rawline',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            // primary: const Color(0xff071d41),
            primary: const Color(0xff1351b4),
            // primaryContainer: const Color(0xffadcdff),
            primaryContainer: const Color(0xff071d41),
            onPrimaryContainer: const Color(0xff94a5bf),
            secondary: const Color(0xff168821),
            secondaryContainer: const Color(0xffe3f5e1),
            error: const Color(0xffb00020),
            background: const Color(0xffffffff),
            onBackground: const Color(0xff000000),
          ),
        ),
        routes: {
          HomePage.routeName: (_) => const HomePage(),
          DetailArticlePage.routeName: (_) => const DetailArticlePage(),
          FavoritesPage.routeName: (_) => const FavoritesPage(),
        },
      ),
    );
  }
}
