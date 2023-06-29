import 'package:flutter/material.dart';

class Pillcards {
transacaoCard() {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        tileColor: Color.fromARGB(255, 233, 233, 233),
        title: Text('Transação'),
      ),
    );
  }

  ganhosCard() {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        tileColor: Color.fromARGB(255, 233, 233, 233),
        title: Text('Ganhos'),
      ),
    );
  }

  gastosCard() {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        tileColor: Color.fromARGB(255, 233, 233, 233),
        title: Text('Gastos'),
      ),
    );
  }
}
