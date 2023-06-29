import 'package:flutter/material.dart';

class mainDrawer extends StatelessWidget {
  const mainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('User'),
          ),
          // ListTile(
          //   leading: const Icon(Icons.home),
          //   title: const Text('Segunda tela'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const SegundaTela()),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Segunda tela'),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, '/segundatela');
            },
          ),
        ],
      ),
    );
  }
}
