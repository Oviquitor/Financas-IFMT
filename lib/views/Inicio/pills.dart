import 'package:flutter/material.dart';
import 'package:fin/views/Inicio/tabs.dart';

Widget pill(title, ActionScreen actions) {
  return ElevatedButton(
    onPressed: () {
      switch (actions) {
        case ActionScreen.transacao:
          changePage(0);
          break;
        case ActionScreen.ganhos:
          changePage(1);
          break;
        case ActionScreen.gastos:
          changePage(2);
          break;
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Text(title),
  );
}

enum ActionScreen { transacao, ganhos, gastos }
