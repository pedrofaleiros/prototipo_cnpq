class FilterValidator {
  String getSearchField(bool isPortuguese) {
    if (isPortuguese) {
      return 'titulo';
    }

    return 'titulo_en';
  }

  bool validateText(String text) {
    if (text.isEmpty || text == '') {
      return false;
    }

    final RegExp regex = RegExp(r'^[a-zA-Z0-9 -áàâãéèêíïóôõöúçñ]*$');
    return regex.hasMatch(text);
  }

  String getQuery(String text, bool isPortuguese) {
    final field = isPortuguese ? 'titulo' : 'titulo_en';

    text = text.replaceAll('-', '');

    var palavras = text.split(" ");

    palavras.removeWhere((element) => element == '');

    if (palavras.isEmpty) {
      return "*:*";
    }

    var query = '';

    for (var i = 0; i < palavras.length; i++) {
      query += '$field:${palavras[i]}';

      if (i != palavras.length - 1) {
        query += " AND ";
      }
    }

    return query;
  }

  String getInitialDate(int? initialDate) {
    if (initialDate != null) {
      if (initialDate >= 2010 && initialDate <= 2023) {
        return initialDate.toString();
      }
    }

    return '*';
  }

  String getFinalDate(int? finalDate) {
    if (finalDate != null) {
      if (finalDate >= 2010 && finalDate <= 2023) {
        return finalDate.toString();
      }
    }
    return '*';
  }

  int getRows(int? rows) {
    if (rows == null) {
      return 10;
    }

    if (rows < 0 || rows > 100) {
      return 10;
    }

    return rows;
  }
}
