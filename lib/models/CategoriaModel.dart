<<<<<<< HEAD
import 'dart:convert';

=======
>>>>>>> 4735ee898f376a63bfa8bf6601fcab4c15470025
class Categoria {
  int? id;
  String? categoria;

  Categoria({this.id, this.categoria});
<<<<<<< HEAD

=======
>>>>>>> 4735ee898f376a63bfa8bf6601fcab4c15470025
  Categoria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoria = json['categoria'];
  }
<<<<<<< HEAD

=======
>>>>>>> 4735ee898f376a63bfa8bf6601fcab4c15470025
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoria'] = categoria;
    return data;
  }
}
