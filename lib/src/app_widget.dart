import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/detail_article_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/main_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/saved_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/home_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';

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
          create: (_) => SavedViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(
              Color(0xff1351b4),
            ),
          ),
          textTheme: const TextTheme(
            labelLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'rawline',
            ),
          ),
          fontFamily: 'rawline',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            // primary: const Color(0xff071d41),
            primary: const Color(0xff1351b4),
            primaryContainer: const Color(0xffd4e5ff),
            onPrimaryContainer: const Color(0xff1c57b7),
            secondary: const Color(0xff168821),
            secondaryContainer: const Color(0xffe3f5e1),
            error: const Color(0xffb00020),
            errorContainer: const Color(0xfffde0db),
            background: const Color(0xffffffff),
            onBackground: const Color(0xff333333),
            onErrorContainer: const Color(0xffdf2107),
            tertiary: const Color(0xff071d41),
            onTertiary: const Color(0xffbfc5ce),
            // onError: Color(0xffdf2107),
          ),
        ),
        // initialRoute: HomePage.routeName,
        routes: {
          MainPage.routeName: (_) => MainPage(),
          HomePage.routeName: (_) => const HomePage(),
          DetailArticlePage.routeName: (_) => const DetailArticlePage(),
          SavedPage.routeName: (_) => const SavedPage(),
        },
      ),
    );
  }
}
