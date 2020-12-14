import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CurrencyListTile extends StatelessWidget {
  final String label;
  final String imagePath;
  final void Function() onTap;

  const CurrencyListTile({
    Key key,
    this.label,
    this.imagePath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black.withOpacity(0.04),
      onTap: onTap,
      contentPadding: const EdgeInsets.all(10.0),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(imagePath),
        radius: 28,
      ),
      title: AutoSizeText(label),
    );
  }
}
