import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final IconData icon;
  final String message;

  const CenteredMessage({
    this.icon,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).primaryColorDark, size: 40),
        const SizedBox(height: 10),
        Text(message, textAlign: TextAlign.center, style: TextStyle(fontSize: 20))
      ],
    );
  }
}
