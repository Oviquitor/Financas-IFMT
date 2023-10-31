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

  final _categoriaController = TextEditingController();
  final GlobalKey<FormState> _formCategoria = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getCategoriaFromApi();
  }

  var appbar = AppBar(
    backgroundColor: Color.fromARGB(255, 27, 75, 72),
    title: Text(
      "Categorias",
      style: TextStyle(color: Colors.white),
    ),
  );

  void getCategoriaFromApi() async {
    var value = await getCategoria(ip: AppRoutes.Ipservidor);
    setState(() {
      listaCategoria = value;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    var maxSizeUtil = (MediaQuery.of(context).size.height -
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
                      height: maxSizeUtil * 0.85,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: listaCategoria.length,
                        itemBuilder: ((context, index) => ListTile(
                              title: Text('${listaCategoria[index].categoria}'),
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
                        "Adicionar Categoria",
                        textAlign: TextAlign.center,
                      ),
                      content: SingleChildScrollView(
                        child: Container(
                          height: maxSizeUtil * 0.19,
                          width: double.maxFinite,
                          child: Form(
                            key: _formCategoria,
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
                                  controller: _categoriaController,
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
                            if (_formCategoria.currentState!.validate()) {
                              try {
                                String msgRetorno = await salvarCategoria(
                                  ip: AppRoutes.Ipservidor,
                                  categoria: _categoriaController.text,
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
                                              'Categoria cadastrada com sucesso') {
                                            setState(() {
                                              _categoriaController.text = '';
                                              _isLoading = true;
                                              getCategoriaFromApi();
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
