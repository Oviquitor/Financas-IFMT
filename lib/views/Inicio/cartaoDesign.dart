import 'package:flutter/material.dart';

Widget cartoes() {
  return SizedBox(
      height: 120,
      width: 310,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.black,
        child: Container(
          child: ListTile(
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text('Bradesco',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsetsDirectional.only(end: 20),
                      child: Icon(Icons.sd_outlined,color: Colors.amber,size: 50,),
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text("RS 10.235,50",
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const Spacer(),
                Text("1040 8532 0066 2503",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Agencia',
                            style: TextStyle(color: Colors.white, fontSize: 7)),
                        Text('0001',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13)),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Conta',
                            style: TextStyle(color: Colors.white, fontSize: 7)),
                        Text('47013598 1',
                            style: TextStyle(color: Colors.white, fontSize: 13))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
  );
}
