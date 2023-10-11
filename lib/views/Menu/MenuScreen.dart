import 'package:financass/views/Banco/BancoScreen.dart';
import 'package:financass/views/Tipopagas/TipopagasScreen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 75, 72),
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(75, 27, 75, 72),
        child: Column(
          children: [
            Align(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BancoScreen()),
                  );
                },
                child: Text('Lista de Bancos',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 68, 255))),
              ),
            ),
            Align(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TipopagasScreen()),
                  );
                },
                child: Text('Lista de Tipo de Pagamento',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 68, 255))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
