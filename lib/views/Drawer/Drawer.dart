import 'package:financass/models/gerenciamentoPagina.dart';
import 'package:financass/views/BancoPage/BancoScreen.dart';
import 'package:financass/views/CartaoPage/CartaoScreen.dart';
import 'package:financass/views/CategoriaPage/CategoriasScreen.dart';
import 'package:financass/views/Menu/MenuScreen.dart';
import 'package:financass/views/TipopagasPage/TipopagasScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatefulWidget {
  MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GerenciamentoPagina(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          BottonScreen(),
          BancoScreen(),
          CartaoScreen(),
          CategoriasScreen(),
          TipopagasScreen(),
        ],
      ),
    );
  }
}
