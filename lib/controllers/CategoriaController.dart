import 'dart:convert';

import 'package:financass/models/CategoriaModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Categoria> analisarCategoria(String responseBody) {
  final list = jsonDecode(responseBody) as List<dynamic>;
  var categoria = list.map((e) => Categoria.fromJson(e)).toList();
  return categoria;
}

Future<List<Categoria>> getCategoria({required String ip}) async {
  String stringRota = '${ip}lista-categoria';
  http.Response response = await http.get(Uri.parse(stringRota));

  if (response.statusCode == 200) {
    return compute(analisarCategoria, response.body);
  } else {
    throw Exception();
  }
}

Future<String> salvarCategoria({
  required String ip,
  required String categoria,
}) async {
  String stringRota = '${ip}cadastrar-categoria';

  http.Response response = await http.post(
    Uri.parse(stringRota),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({"categoria": categoria}),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception();
  }
}
