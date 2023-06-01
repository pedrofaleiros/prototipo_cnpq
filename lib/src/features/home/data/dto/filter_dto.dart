class FilterDto {
  final String query;
  final int rows;
  final String initialDate;
  final String finalDate;

  FilterDto({
    required this.query,
    required this.rows,
    required this.initialDate,
    required this.finalDate,
  });
}
