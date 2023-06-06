import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'generated/filter_viewmodel.g.dart';

class FilterViewModel = _FilterViewModelBase with _$FilterViewModel;

abstract class _FilterViewModelBase with Store {
  final TextEditingController textController = TextEditingController();
  String get text => textController.text;

  @observable
  int rows = 10;

  @observable
  int? initialDate;

  @observable
  int? finalDate;

  @observable
  bool isPortuguese = true;

  @action
  void setRows(int? value) {
    rows = value ?? 10;
  }

  @action
  void setInitialDate(int? value) {
    if (finalDate != null && value != null) {
      if (finalDate! <= value) {
        finalDate = null;
      }
    }

    initialDate = value;
  }

  @action
  void setFinalDate(int? value) {
    if (initialDate != null && value != null) {
      if (initialDate! >= value) {
        initialDate = null;
      }
    }

    finalDate = value;
  }

  @action
  void changeFieldLang(bool value) {
    isPortuguese = value;
  }
}
