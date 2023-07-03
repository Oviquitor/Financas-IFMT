import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromARGB(255, 22, 71, 61),
      padding: const EdgeInsets.fromLTRB(40, 30, 40, 50),
      //height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: const [
              Text(
                'Finanças',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Row(
              children: const [
                Align(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Divider(
              color: Colors.black.withAlpha(900),
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
