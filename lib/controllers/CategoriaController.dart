import 'dart:convert';

import 'package:financass/models/CategoriaModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Categoria> analisarCategoria(String reponseBody) {
  final list = jsonDecode(reponseBody) as List<dynamic>;
  var categorias = list.map((e) => Categoria.fromJson(e)).toList();
  return categorias;
}

Future<List<Categoria>> getCategoria({required String ip}) async {
  String stringRota = '${ip}lista-categoria';
  http.Response response = await http.get(Uri.parse(stringRota));

  if (response.statusCode == 200) {
    // print(response.body);
    return compute(analisarCategoria, response.body);
  } else {
    throw Exception();
  }
}

Future<String> salvarCategoria({
  required String ip,
  required String banco,
  required String conta,
  required String agencia,
  required double saldo,
}) async {
  String stringRota = '${ip}cadastrar-categoria';

  http.Response response = await http.post(
    Uri.parse(stringRota),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "banco": banco,
      "conta": conta,
      "agencia": agencia,
      "saldo": saldo,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception();
  }
}
