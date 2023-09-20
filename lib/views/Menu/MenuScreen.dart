import 'package:financass/views/Banco/BancoScreen.dart';
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
        backgroundColor: const Color.fromARGB(255, 60, 39, 176),
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Align(
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
      ),
    );
  }
}
