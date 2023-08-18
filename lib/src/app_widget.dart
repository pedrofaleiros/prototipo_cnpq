import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/detail_article_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/saved_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/home_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/tabs_page.dart';
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
          textTheme: const TextTheme(
            labelLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'rawline',
            ),
          ),
          fontFamily: 'rawline',
          colorScheme: _lightTheme,
        ),
        // DESCOMENTE PARA ATIVAR O MODO ESCURO AUTOMATICO
        // darkTheme: ThemeData(
        //   textTheme: const TextTheme(
        //     labelLarge: TextStyle(
        //       fontWeight: FontWeight.w700,
        //       fontFamily: 'rawline',
        //     ),
        //   ),
        //   fontFamily: 'rawline',
        //   colorScheme: _darkTheme,
        // ),
        initialRoute: TabsPage.routeName,
        routes: {
          // MainPage.routeName: (_) => MainPage(),
          HomePage.routeName: (_) => const HomePage(),
          DetailArticlePage.routeName: (_) => const DetailArticlePage(),
          SavedPage.routeName: (_) => const SavedPage(),
          TabsPage.routeName: (_) => const TabsPage(),
        },
      ),
    );
  }
}

ColorScheme get _lightTheme => ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff1351b4),
      primaryContainer: const Color(0xffADCDFF),
      onPrimaryContainer: const Color(0xff071d41),
      onPrimary: const Color(0xffffffff),
      //
      secondary: const Color(0xff168821),
      secondaryContainer: const Color(0xffe3f5e1),
      onSecondaryContainer: const Color(0xff154C21),
      //
      background: const Color(0xffffffff),
      onBackground: const Color(0xff1c1c1c),

      error: const Color(0xffb00020),
      errorContainer: const Color(0xfffde0db),
      //
    );

ColorScheme get _darkTheme => ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.dark,

      onPrimary: const Color(0xffffffff),

      primary: const Color(0xffADCDFF),
      primaryContainer: const Color(0xff071d41),
      onPrimaryContainer: const Color(0xff1351b4),
      //
      secondary: const Color(0xffADCDFF),
      secondaryContainer: const Color(0xff071d41),
      onSecondaryContainer: const Color(0xff1351b4),
      //
      // secondary: const Color(0xffe3f5e1),
      // secondaryContainer: const Color(0xff154C21),
      // onSecondaryContainer: const Color(0xff168821),
      //
      background: const Color(0xff000000),
      onBackground: const Color(0xffffffff),
      //
      error: const Color(0xfffde0db),
      errorContainer: const Color(0xffB00020),
      //
      tertiary: const Color(0xff168821),
    );


/*
= = = = = = = = = = = = = LIGHT THEME = = = = = = = = = = = = =

ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff1351b4),
            primaryContainer: const Color(0xffADCDFF),
            onPrimaryContainer: const Color(0xff071d41),
            onPrimary: const Color(0xffffffff),
            //
            secondary: const Color(0xff168821),
            secondaryContainer: const Color(0xffe3f5e1),
            onSecondaryContainer: const Color(0xff154C21),
            //
            background: const Color(0xffffffff),
            onBackground: const Color(0xff1c1c1c),
            //
            error: const Color(0xffb00020),
            onErrorContainer: const Color(0xffdf2107),
            errorContainer: const Color(0xfffde0db),
            //
          )

 */

/* 
= = = = = = = = = = = = = DARK THEME = = = = = = = = = = = = =

ColorScheme.fromSwatch().copyWith(
            brightness: Brightness.dark,

            onSecondaryContainer: const Color(0xff1351b4),
            secondary: const Color(0xffADCDFF),
            secondaryContainer: const Color(0xff071d41),
            onPrimary: const Color(0xffffffff),
            //
            onPrimaryContainer: const Color(0xff168821),
            primary: const Color(0xffe3f5e1),
            primaryContainer: const Color(0xff154C21),
            //
            background: const Color(0xff1c1c1c),
            onBackground: const Color(0xffffffff),
            //
            error: const Color(0xffb00020),
            onErrorContainer: const Color(0xffdf2107),
            errorContainer: const Color(0xfffde0db),
            //
          )

 */