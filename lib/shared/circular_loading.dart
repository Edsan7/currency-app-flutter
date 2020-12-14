import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final Color backgroundColor;
  final EdgeInsets margin;
  
  const CircularLoading({
    Key key,
    this.backgroundColor = Colors.white60,
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
