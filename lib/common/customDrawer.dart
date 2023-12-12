import 'package:financass/common/headerDrawer.dart';
import 'package:financass/common/tituloDrawer.dart';
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
                iconData: Icons.account_balance,
                titulo: 'Banco',
                pagina: 1,
              ),
              TituloDrawer(
                iconData: Icons.credit_card,
                titulo: 'Cartao',
                pagina: 2,
              ),
              TituloDrawer(
                iconData: Icons.category,
                titulo: 'Categoria',
                pagina: 2,
              ),
              TituloDrawer(
                iconData: Icons.payment,
                titulo: 'Tipo de Pagamento',
                pagina: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
