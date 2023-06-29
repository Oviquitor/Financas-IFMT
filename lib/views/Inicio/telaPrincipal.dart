import 'package:flutter/material.dart';
import 'package:fin/views/Inicio/tabs.dart';
import 'package:fin/views/Inicio/circularButtons.dart';

import 'cartaoDesign.dart';
import 'catbox.dart';

class telaPrincipal extends StatefulWidget {
  const telaPrincipal({super.key});

  @override
  State<telaPrincipal> createState() => _telaPrincipalState();
}

class _telaPrincipalState extends State<telaPrincipal> {
  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: availableHeight * (0.21),
            padding: EdgeInsetsDirectional.only(start: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                cartoes(),
                cartoes(),
                cartoes(),
                cartoes(),
              ],
            ),
          ),
          Container(
            height: availableHeight * (0.12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons(Icons.arrow_upward_outlined),
                buttons(Icons.arrow_downward_outlined),
                buttons(Icons.house_outlined),
                buttons(Icons.pie_chart_outline_outlined),
              ],
            ),
          ),
          Container(
            height: availableHeight * (0.03),
            alignment: Alignment.topLeft,
            padding: EdgeInsetsDirectional.only(start: 15),
            child: const Text(
              "Categorias",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
          Container(
            height: availableHeight * (0.13),
            padding: EdgeInsetsDirectional.only(start: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                box(),
                box(),
                box(),
                box(),
                box(),
                box(),
              ],
            ),
          ),
          Container(
            height: availableHeight * (0.3895),
            padding: EdgeInsets.all(10),
            alignment: Alignment.topCenter,
            child: TabBarDemo(),
          ),
        ],
      ),
    );
  }
}
