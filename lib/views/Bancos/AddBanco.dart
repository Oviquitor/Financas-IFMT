import 'package:fin/common/customDrawer/customDrawer.dart';
import 'package:flutter/material.dart';

class CardsInformacoes {
  String banco;
  String agencia;
  String contaCorrente;
  double saldo;

  CardsInformacoes({
    required this.banco,
    required this.agencia,
    required this.contaCorrente,
    required this.saldo,
  });
}

class telaBanco extends StatefulWidget {
  @override
  _telaBancoState createState() => _telaBancoState();
}

class _telaBancoState extends State<telaBanco> {
  List<CardsInformacoes> _cards = [
    CardsInformacoes(
        banco: 'Itaú',
        agencia: '1234',
        contaCorrente: '56789-0',
        saldo: 1000.0),
    CardsInformacoes(
        banco: 'Bradesco',
        agencia: '4321',
        contaCorrente: '09876-5',
        saldo: 500.0),
  ];

  void _AddBanco() {
    String banco = '';
    String agencia = '';
    String contaCorrente = '';
    double saldo = 0.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Adicionar Banco',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  onChanged: (value) => banco = value,
                  decoration: InputDecoration(
                    labelText: 'Banco',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => agencia = value,
                  decoration: InputDecoration(
                    labelText: 'Agência',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => contaCorrente = value,
                  decoration: InputDecoration(
                    labelText: 'Conta',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => saldo = double.parse(value),
                  decoration: InputDecoration(
                    labelText: 'Saldo',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.red.withOpacity(0.2)),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
              ),
              child: Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _cards.add(CardsInformacoes(
                    banco: banco,
                    agencia: agencia,
                    contaCorrente: contaCorrente,
                    saldo: saldo,
                  ));
                });
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 144, 162, 145)),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: Text(
                'Adicionar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Bancos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Opções'),
                      content: Text('Escolha uma opção:'),
                      actions: [
                        TextButton(
                          child: Text('Excluir'),
                          onPressed: () {
                            setState(() {
                              _cards.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Editar'),
                          onPressed: () {
                            _editCard(index);
                          },
                        ),
                        TextButton(
                          child: Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Banco: ${_cards[index].banco}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Agência: ${_cards[index].agencia}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Conta: ${_cards[index].contaCorrente}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Saldo: R\$ ${_cards[index].saldo.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _AddBanco,
        child: Icon(Icons.add),
      ),
    );
  }

  void _editCard(int index) {
    TextEditingController bancoController = TextEditingController();
    TextEditingController agenciaController = TextEditingController();
    TextEditingController contaController = TextEditingController();

    bancoController.text = _cards[index].banco;
    agenciaController.text = _cards[index].agencia;
    contaController.text = _cards[index].contaCorrente;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Cartão'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Banco'),
              TextField(
                controller: bancoController,
              ),
              SizedBox(height: 8),
              Text('Agência'),
              TextField(
                controller: agenciaController,
              ),
              SizedBox(height: 8),
              Text('Conta Corrente'),
              TextField(
                controller: contaController,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                setState(() {
                  _cards[index].banco = bancoController.text;
                  _cards[index].agencia = agenciaController.text;
                  _cards[index].contaCorrente = contaController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
