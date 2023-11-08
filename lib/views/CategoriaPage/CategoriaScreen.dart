import 'package:financass/config/Rotas.dart';
import 'package:financass/controllers/CategoriaController.dart';
import 'package:financass/models/CategoriaModel.dart';
import 'package:flutter/material.dart';

class CategoriaScreen extends StatefulWidget {
  const CategoriaScreen({super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  List<Categoria> listaCategoria = [];
  bool _isLoading = false;

  void iniState() {
    super.initState();
    _isLoading = true;
    getCategoriaFromApi();
  }

  void getCategoriaFromApi() async {
    var value = await getCategoria(ip: AppRoutes.Ipservidor);
    setState(() {
      listaCategoria = value;
    });
    _isLoading = false;
  }

  var appBar = AppBar(
    backgroundColor: Color.fromARGB(255, 77, 75, 72),
  
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
