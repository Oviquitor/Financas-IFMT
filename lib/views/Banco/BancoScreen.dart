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

  final _bancoController = TextEditingController();
  final _agenciaController = TextEditingController();
  final _contaController = TextEditingController();
  final _saldoController = TextEditingController();
  final GlobalKey<FormState> _formBanco = GlobalKey<FormState>();

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
    backgroundColor: Color.fromARGB(255, 27, 75, 72),
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
            FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 27, 75, 72),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      insetPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      title: Text(
                        'Adicionar',
                        textAlign: TextAlign.center,
                      ),
                      content: SingleChildScrollView(
                        child: Container(
                          height: maxSizeUtilBody * 0.6,
                          width: double.maxFinite,
                          child: Form(
                            key: _formBanco,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (banco) {
                                    String bancoDigitado = banco ?? '';
                                    if (bancoDigitado.isEmpty) {
                                      return 'Campo banco deve ser preenchido.';
                                    }
                                    return null;
                                  },
                                  controller: _bancoController,
                                  decoration: InputDecoration(
                                    labelText: 'Banco',
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: maxSizeUtilBody * 0.02,
                                ),
                                TextFormField(
                                  validator: (agencia) {
                                    String agenciaDigitada = agencia ?? '';
                                    if (agenciaDigitada.isEmpty) {
                                      return 'Agencia nao foi preenchido';
                                    }
                                    return null;
                                  },
                                  controller: _agenciaController,
                                  decoration: InputDecoration(
                                    labelText: 'Agência',
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: maxSizeUtilBody * 0.02,
                                ),
                                TextFormField(
                                  validator: (conta) {
                                    String ContaDigitada = conta ?? '';
                                    if (ContaDigitada.isEmpty) {
                                      return 'Conta nao foi preenchido';
                                    }
                                    return null;
                                  },
                                  controller: _contaController,
                                  decoration: InputDecoration(
                                    labelText: 'Conta',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: maxSizeUtilBody * 0.02,
                                ),
                                TextFormField(
                                  validator: (saldo) {
                                    String saldoDigitado = saldo ?? '';
                                    if (saldoDigitado.isEmpty) {
                                      return 'Campo nao foi preenchido';
                                    }
                                    if (double.tryParse(saldoDigitado)
                                            is double ||
                                        saldoDigitado == 0) {
                                      return null;
                                    }
                                    return 'Valor informado não é válido.';
                                  },
                                  keyboardType: TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                                  controller: _saldoController,
                                  decoration: InputDecoration(
                                    labelText: 'Saldo',
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
                            if (_formBanco.currentState!.validate()) {
                              try {
                                String mensagemRetorno = await salvarBanco(
                                  ip: AppRoutes.Ipservidor,
                                  banco: _bancoController.text,
                                  conta: _contaController.text,
                                  agencia: _agenciaController.text,
                                  saldo: double.parse(_saldoController.text),
                                );

                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text('Mensagem Api'),
                                    content: Text('${mensagemRetorno}'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if (mensagemRetorno ==
                                              'Banco cadastrado com sucesso') {
                                            setState(() {
                                              _contaController.text = '';
                                              _bancoController.text = '';
                                              _saldoController.text = '';
                                              _agenciaController.text = '';
                                              _isLoading = true;
                                              getbancosFromApi();
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
                                  builder: (ctx) => AlertDialog(
                                    title: Text('Erro!'),
                                    content: Text('${e.toString()}'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Ok'),
                                      )
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            'Salvar',
                          ),
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
