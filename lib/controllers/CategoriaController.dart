import 'dart:convert';

import 'package:financass/models/CategoriaModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

<<<<<<< HEAD
List<Categoria> analisarCategoria(String reponseBody) {
  final list = jsonDecode(reponseBody) as List<dynamic>;
  var categorias = list.map((e) => Categoria.fromJson(e)).toList();
  return categorias;
=======
List<Categoria> analisarCategoria(String responseBody) {
  final list = jsonDecode(responseBody) as List<dynamic>;
  var categoria = list.map((e) => Categoria.fromJson(e)).toList();
  return categoria;
>>>>>>> 4735ee898f376a63bfa8bf6601fcab4c15470025
}

Future<List<Categoria>> getCategoria({required String ip}) async {
  String stringRota = '${ip}lista-categoria';
  http.Response response = await http.get(Uri.parse(stringRota));

  if (response.statusCode == 200) {
<<<<<<< HEAD
    // print(response.body);
=======
>>>>>>> 4735ee898f376a63bfa8bf6601fcab4c15470025
    return compute(analisarCategoria, response.body);
  } else {
    throw Exception();
  }
}

Future<String> salvarCategoria({
  required String ip,
<<<<<<< HEAD
  required String banco,
  required String conta,
  required String agencia,
  required double saldo,
=======
  required String categoria,
>>>>>>> 4735ee898f376a63bfa8bf6601fcab4c15470025
}) async {
  String stringRota = '${ip}cadastrar-categoria';

  http.Response response = await http.post(
    Uri.parse(stringRota),
    headers: {
      'Content-Type': 'application/json',
    },
<<<<<<< HEAD
    body: jsonEncode({
      "banco": banco,
      "conta": conta,
      "agencia": agencia,
      "saldo": saldo,
    }),
=======
    body: jsonEncode({"categoria": categoria}),
>>>>>>> 4735ee898f376a63bfa8bf6601fcab4c15470025
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception();
  }
}
