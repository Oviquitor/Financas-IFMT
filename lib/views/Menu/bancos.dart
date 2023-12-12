import 'package:financass/common/customDrawer.dart';
import 'package:flutter/material.dart';

class Bancos extends StatelessWidget {
  const Bancos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Teste'),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
