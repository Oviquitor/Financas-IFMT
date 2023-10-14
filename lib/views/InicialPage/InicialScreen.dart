import 'package:financass/views/Menu/MenuScreen.dart';
import 'package:flutter/material.dart';

class InicialScreen extends StatelessWidget {
  const InicialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 206, 252, 205),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Align(
                  child: Text(
                    'Finanças',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, elevation: 5),
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MenuScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
