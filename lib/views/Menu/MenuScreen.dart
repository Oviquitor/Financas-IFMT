import 'package:financass/views/BancoPage/BancoScreen.dart';
import 'package:financass/views/CategoriaPage/CategoriasScreen.dart';
import 'package:financass/views/Menu/ConversaoScreen.dart';
import 'package:financass/views/Menu/dashboard.dart';
import 'package:financass/views/Menu/home.dart';
import 'package:financass/views/TipopagasPage/TipopagasScreen.dart';
import 'package:financass/views/CartaoPage/CartaoScreen.dart';
import 'package:flutter/material.dart';

class BottonScreen extends StatefulWidget {
  const BottonScreen({Key? key});

  @override
  State<BottonScreen> createState() => _BottonScreenState();
}

class _BottonScreenState extends State<BottonScreen> {
  int _selecionadoIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOpcao = <Widget>[
    HomePage(),
    ConversaoScreen(),
  ];

  void _onItemSelecianado(int index) {
    setState(() {
      _selecionadoIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOpcao.elementAt(_selecionadoIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Conversao',
            backgroundColor: Colors.black,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.trending_down),
          //   label: 'Pagamentos',
          //   backgroundColor: Colors.black,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.checklist),
          //   label: 'Extrato',
          //   backgroundColor: Colors.black,
          // ),
        ],
        currentIndex: _selecionadoIndex,
        selectedItemColor: Color.fromARGB(255, 0, 39, 212),
        onTap: _onItemSelecianado,
      ),
    );
  }
}

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
        backgroundColor: const Color.fromARGB(255, 27, 75, 72),
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(75, 27, 75, 72),
        child: Column(
          children: [
            Align(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TipopagasScreen()),
                  );
                },
                child: Text('Lista de Tipos Pagamentos',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            Align(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CategoriasScreen()),
                  );
                },
                child: Text('Lista de Categorias',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            // Align(
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => BancoScreen()),
            //       );
            //     },
            //     child: Text('Lista de Bancos',
            //         style: TextStyle(
            //             fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
            //   ),
            // ),
            // Align(
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => CartaoScreen()),
            //       );
            //     },
            //     child: Text('Lista de Cartões',
            //         style: TextStyle(
            //             fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
