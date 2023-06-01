class ArticleModel {
  final String id;
  final String? titulo;
  final String? tituloEn;
  final int? anoProducao;
  final String? url;

  ArticleModel({
    required this.id,
    this.titulo,
    this.tituloEn,
    this.anoProducao,
    this.url,
  });

  factory ArticleModel.fromMap(dynamic map) {
    return ArticleModel(
      id: map['id'] ?? DateTime.now().toString(),
      titulo: map['titulo'],
      tituloEn: map['titulo_en'],
      anoProducao: map['ano_producao'],
      url: map['url_producao'],
    );
  }

  String toJson() {
    return '{"id": "$id","titulo": "$titulo","titulo_en": "$tituloEn","ano_producao": $anoProducao, "url_producao":$url}';
  }
}

// ArticleModel copyWith({
//   String? id,
//   String? titulo,
//   String? tituloEn,
//   int? anoProducao,
// }) {
//   return ArticleModel(
//     id: id ?? this.id,
//     titulo: titulo ?? this.titulo,
//     tituloEn: tituloEn ?? this.tituloEn,
//     anoProducao: anoProducao ?? this.anoProducao,
//   );
// }
//
// Map<String, dynamic> toMap() {
//   return {
//     'id': id,
//     'titulo': titulo,
//     'titulo_en': tituloEn,
//     'ano_edicao': anoProducao,
//   };
// }

// factory ArticleModel.fromMap(Map<String, dynamic> map) {
//   return ArticleModel(
//     id: DateTime.now().toString(),
//     titulo: map['titulo'],
//     tituloEn: map['titulo_en'],
//     anoProducao: int.tryParse(map['ano_edicao']) ?? -1,
//   );
// }

// factory ArticleModel.fromMapSolr(Map<String, dynamic> map) {
//   return ArticleModel(
//     id: DateTime.now().toString(),
//     titulo: map['titulo'][0],
//     tituloEn: map['titulo_en'][0],
//     anoProducao: map['ano_edicao'][0],
//   );
// }

// String toJson() {
//   return '{"id": "$id","titulo": "$titulo","titulo_en": "$tituloEn","ano_edicao": $anoProducao}';
// }