class FilterModel {
  final String query;
  final int? rows;
  final int? initialDate;
  final int? finalDate;
  final bool isPortuguese;

  FilterModel({
    this.query = '',
    this.rows,
    this.initialDate,
    this.finalDate,
    this.isPortuguese = true,
  });

  FilterModel copyWith({
    String? query,
    int? rows,
    int? initialDate,
    int? finalDate,
    bool? isPortuguese,
  }) {
    return FilterModel(
      query: query ?? this.query,
      rows: rows ?? this.rows,
      initialDate: initialDate ?? this.initialDate,
      finalDate: finalDate ?? this.finalDate,
      isPortuguese: isPortuguese ?? this.isPortuguese,
    );
  }
}
