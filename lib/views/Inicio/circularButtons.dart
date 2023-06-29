import 'package:flutter/material.dart';

Widget buttons(buttonicon) {
  return ElevatedButton(
    onPressed: () {},
    child: Icon(buttonicon, color: Colors.white),
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}
