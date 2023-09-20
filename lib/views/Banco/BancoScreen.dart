import 'package:financass/config/Rotas.dart';
import 'package:financass/controllers/BancoController.dart';
import 'package:financass/models/BancoModel.dart';
import 'package:flutter/material.dart';

class BancoScreen extends StatefulWidget {
  const BancoScreen({super.key});

  @override
  State<BancoScreen> createState() => _BancoScreenState();
}

List<Banco> listaBancos = [];

void getbancosFromApi() async {
  listaBancos = await getBanco(ip: AppRoutes.Ipservidor);
}

class _BancoScreenState extends State<BancoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getbancosFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 39, 176),
        title: Text(
          'Lista de Bancos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView.builder(
          itemCount: listaBancos!.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text('${listaBancos![index].banco}'),
              )),
        ),
      ),
    );
  }
}
