import 'package:financass/config/Rotas.dart';
import 'package:financass/controllers/BancoController.dart';
import 'package:financass/models/BancoModel.dart';
import 'package:flutter/material.dart';

class BancoScreen extends StatefulWidget {
  const BancoScreen({super.key});

  @override
  State<BancoScreen> createState() => _BancoScreenState();
}

class _BancoScreenState extends State<BancoScreen> {
  List<Banco> listaBancos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getbancosFromApi();
  }

  void getbancosFromApi() async {
    var value = await getBanco(ip: AppRoutes.Ipservidor);
    setState(() {
      listaBancos = value;
    });
    _isLoading = false;
  }

  var appBar = AppBar(
    backgroundColor: Color.fromARGB(255, 206, 196, 227),
    title: Text(
      'Lista de Bancos',
      style: TextStyle(color: Colors.white),
    ),
    centerTitle: true,
  );

  @override
  Widget build(BuildContext context) {
    var maxSizeUtilBody = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            child: _isLoading
                ? LinearProgressIndicator(
                    minHeight: 5,
                  )
                : Container(
                    height: maxSizeUtilBody * 0.85,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: listaBancos.length,
                      itemBuilder: ((context, index) => ListTile(
                            title: Text('${listaBancos![index].banco}'),
                          )),
                    ),
                  ),
          ),
          _isLoading
              ? Container()
              : FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {},
                ),
        ],
      ),
    );
  }
}
