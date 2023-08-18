import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/pages/main_page.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/material_components/show_snack_bar.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/remove_overscroll_indicator.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/saved_viewmodel.dart';
import 'package:provider/provider.dart';

import '../widgets/saved/saved_list_view.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  static const routeName = '/saved';

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  String getData(List<dynamic> response) {
    final list = <List<dynamic>>[];
    list.add(["id", "titulo", "tituloEn", "anoProducao"]);
    for (var e in response) {
      list.add([e.id, e.titulo, e.tituloEn, e.anoProducao]);
    }

    String csvData = const ListToCsvConverter().convert(
      list,
      fieldDelimiter: ';',
    );

    return csvData;
  }

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      width: MediaQuery.of(context).size.width > 700 ? 700 - 32 : null,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      content: Text(
        'Download concluido com sucesso!',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.w600,
          fontFamily: 'rawline',
        ),
      ),
    ));
  }

  bool isLoading = false;
  void setIsLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pushReplacementNamed(
          context,
          MainPage.routeName,
        );
        return false;
      },
      child: RemoveOverscrollIndicator(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor:
                Theme.of(context).colorScheme.brightness == Brightness.dark
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.secondary,
            onPressed: isLoading
                ? null
                : () async {

                    final response = context.read<SavedViewModel>().favorites;
                    if(response.isEmpty) return;

                    setIsLoading(true);

                    final csvData = getData(response);

                    try {
                      final dir = await getDownloadsDirectory();

                      final time = DateTime.now();
                      if (dir != null) {
                        File file = File(
                            '${dir.path}/artigos_${time.month}${time.day}${time.hour}${time.minute}${time.second}.csv');
                        await file.writeAsString(csvData).then(
                          (value) {
                            _showSuccessSnackBar(context);
                          },
                        ).catchError(
                          (e) {
                            print(
                              e.toString(),
                            );
                            setIsLoading(false);
                          },
                        );
                      }
                    } catch (e) {
                      print(e.toString());
                    } finally {
                      setIsLoading(false);
                    }
                  },
            child: isLoading
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.brightness ==
                            Brightness.dark
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).colorScheme.background,
                  )
                : const Icon(
                    Icons.download,
                  ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: const SavedLisview(),
            ),
          ),
        ),
      ),
    );
  }
}
