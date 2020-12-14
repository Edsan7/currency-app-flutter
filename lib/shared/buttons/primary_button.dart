import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const PrimaryButton({
    Key key,
    this.onPressed,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: RaisedButton(
        child: Text(
          label,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onPressed,
        color: Colors.blueAccent[700],
      ),
    );
  }
}
