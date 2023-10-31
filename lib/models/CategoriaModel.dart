class Categoria {
  int? id;
  String? categoria;

  Categoria({this.id, this.categoria});
  Categoria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoria = json['categoria'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoria'] = categoria;
    return data;
  }
}
