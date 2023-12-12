import 'package:flutter/material.dart';

class CardActionWidget extends StatelessWidget {
  const CardActionWidget(
      {super.key,
      required this.icon,
      required this.description,
      required this.onTap});
  final IconData icon;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 40,
              ),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
