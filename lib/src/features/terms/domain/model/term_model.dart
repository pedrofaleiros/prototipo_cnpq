class TermModel {
  final String id;
  final String name;
  final List<String> terms;

  TermModel({
    required this.id,
    required this.name,
    required this.terms,
  });

  factory TermModel.fromMap(dynamic map) {
    final List<String> terms = [];

    final List<dynamic> aux = map['terms'] as List<dynamic>;

    for (var element in aux) {
      terms.add(element as String);
    }

    return TermModel(
      id: map['ConceptUI'] ?? DateTime.now().toString(),
      name: map['ConceptName'],
      terms: terms,
    );
  }
}
