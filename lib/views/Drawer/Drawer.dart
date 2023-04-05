import 'package:farm/common/customDrawer/headerDrawer.dart';
import 'package:farm/models/gerenciamentoPagina.dart';
import 'package:farm/views/configPage/config.dart';
import 'package:farm/views/menuPage/menu.dart';
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
          Menu(),
          Config(),
        ],
      ),
    );
  }
}
