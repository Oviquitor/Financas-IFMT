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
    var value = await getTipopaga(ip: AppRoutes.Ipservidor);
    setState(() {
      listaTipopagas = value;
    });
    _isLoading = false;
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
                      content: SingleChildScrollView(
                        child: Container(
                          height: maxBodySize * 0.19,
                          width: double.maxFinite,
                          child: Form(
                            key: _formTipopaga,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (tipo) {
                                    String tipoDigitado = tipo ?? '';
                                    if (tipoDigitado.isEmpty) {
                                      return 'Esse campo não pode estar vazio.';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _tipoController,
                                  decoration: InputDecoration(
                                    labelText: 'Tipo',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            if (_formTipopaga.currentState!.validate()) {
                              try {
                                String msgRetorno = await salvaTipopaga(
                                  ip: AppRoutes.Ipservidor,
                                  tipo: _tipoController.text,
                                );

                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Mensagem API'),
                                    content: Text('${msgRetorno}'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if (msgRetorno ==
                                              'Tipo de Pagamento cadastrado com sucesso') {
                                            setState(() {
                                              _tipoController.text = '';
                                              _isLoading = true;
                                              getTipopagasFromAPI();
                                            });
                                            Navigator.of(context).pop();
                                          }
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Ok'),
                                      )
                                    ],
                                  ),
                                );
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Erro!'),
                                    content: Text('${e}'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          child: Text("Salvar"),
                        )
                      ],
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
