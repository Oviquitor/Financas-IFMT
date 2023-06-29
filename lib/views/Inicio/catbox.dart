import 'package:flutter/material.dart';

Widget box() {
  return SizedBox(
    width: 121,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.black, width: 3),
      ),
      child: Container(
        child: ListTile(
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "RS814,21",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text("---------"),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag_outlined, color: Colors.black,),
                    Text("Shoping", style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
