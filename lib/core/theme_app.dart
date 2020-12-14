import 'package:flutter/material.dart';

final themeApp = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    padding: const EdgeInsets.all(15),
    buttonColor: Colors.blue[800]
  ),
);