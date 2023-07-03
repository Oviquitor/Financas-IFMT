import 'package:fin/common/customDrawer/headerDrawer.dart';
import 'package:fin/common/customDrawer/tituloDrawer.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          ListView(
            children: [
              HeaderDrawer(),
              TituloDrawer(
                iconData: Icons.home,
                titulo: 'Inicio',
                pagina: 0,
              ),
              TituloDrawer(
                iconData: Icons.settings,
                titulo: 'Banco',
                pagina: 1,
              ),
              TituloDrawer(
                iconData: Icons.menu_book,
                titulo: 'Categoria',
                pagina: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
