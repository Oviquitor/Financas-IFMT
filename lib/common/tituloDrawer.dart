import 'package:financass/models/gerenciamentoPagina.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TituloDrawer extends StatelessWidget {
  final IconData iconData;
  final String titulo;
  final int pagina;
  const TituloDrawer(
      {super.key,
      required this.iconData,
      required this.titulo,
      required this.pagina});

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<GerenciamentoPagina>().paginaAtual;
    Color setColor = currentPage == pagina
        ? Color.fromARGB(255, 15, 66, 55)
        : Color.fromARGB(255, 95, 95, 95);

    return InkWell(
      onTap: () {
        context.read<GerenciamentoPagina>().setPage(pagina);
      },
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Icon(
                iconData,
                size: 30,
                color: setColor,
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 16,
                color: setColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
