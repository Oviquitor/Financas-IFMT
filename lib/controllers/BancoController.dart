import 'dart:convert';

import 'package:financass/models/BancoModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Banco> analisarBanco(String reponseBody) {
  final list = jsonDecode(reponseBody) as List<dynamic>;
  var bancos = list.map((e) => Banco.fromJson(e)).toList();
  return bancos;
}

Future<List<Banco>> getBanco({required String ip}) async {
  String stringRota = '${ip}lista-banco';
  http.Response response = await http.get(Uri.parse(stringRota));

  if (response.statusCode == 200) {
    // print(response.body);
    return compute(analisarBanco, response.body);
  } else {
    throw Exception();
  }
}
