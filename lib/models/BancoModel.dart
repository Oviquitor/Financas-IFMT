class Banco {
  int? id;
  String? banco;
  String? agenica;
  String? conta;

  Banco({this.id, this.banco});

  Banco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banco = json['banco'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banco'] = banco;
    return data;
  }
}
