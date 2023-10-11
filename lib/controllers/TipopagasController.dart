import 'dart:convert';

import 'package:financass/models/TipopagasModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Tipopagas> analisarTipopagas(String responseBody) {
  final list = jsonDecode(responseBody) as List<dynamic>;
  var tipopaga = list.map((e) => Tipopagas.fromJson(e)).toList();
  return tipopaga;
}

Future<List<Tipopagas>> getTipopaga({required String ip}) async {
  String rota = '${ip}lista-tipopaga';
  http.Response response = await http.get(Uri.parse(rota));

  if (response.statusCode == 200) {
    return compute(analisarTipopagas, response.body);
  } else {
    throw Exception();
  }
}

Future<String> salvaTipopaga({required String ip, required String tipo}) async {
  String rota = '${ip}cadastrar-tipopaga';

  http.Response response = await http.post(
    Uri.parse(rota),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({"tipo": tipo}),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception();
  }
}
