import 'package:financass/config/Rotas.dart';
import 'package:financass/controllers/TipopagasController.dart';
import 'package:financass/models/TipopagasModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TipopagasScreen extends StatefulWidget {
  const TipopagasScreen({super.key});

  @override
  State<TipopagasScreen> createState() => _TipopagasScreenState();
}

class _TipopagasScreenState extends State<TipopagasScreen> {
  List<Tipopagas> listaTipopagas = [];
  bool _isLoading = false;

  final _tipoController = TextEditingController();
  final GlobalKey<FormState> _formTipopaga = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getTipopagasFromAPI();
  }

  void getTipopagasFromAPI() async {
    try {
      await getTipopaga(ip: AppRoutes.Ipservidor).then((value) {
        setState(() {
          listaTipopagas = value;
        });
      });
      _isLoading = false;
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Atenção!'),
          content: Text('${e}'),
        ),
      );
    }
  }

  var appbar = AppBar(
    backgroundColor: Color.fromARGB(255, 27, 75, 72),
    title: Text(
      "Tipo de Pagamento",
      style: TextStyle(color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var maxBodySize = (MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: appbar,
      body: Container(
        color: Color.fromARGB(75, 27, 75, 72),
        child: Column(
          children: [
            Container(
              child: _isLoading
                  ? LinearProgressIndicator(
                      minHeight: 5,
                    )
                  : Container(
                      height: maxBodySize * 0.85,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: listaTipopagas.length,
                        itemBuilder: ((context, index) => ListTile(
                              title: Text('${listaTipopagas[index].tipo}'),
                            )),
                      ),
                    ),
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      insetPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      title: Text(
                        "Adicionar Tipo de Pagamento",
                        textAlign: TextAlign.center,
                        
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
