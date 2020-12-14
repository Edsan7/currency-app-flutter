import 'package:currency_app/core/theme_app.dart';
import 'package:currency_app/pages/currencies/currencies.dart';
import 'package:currency_app/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency App',
      theme: themeApp,
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => Homepage(),
        '/homepage/currencies': (context) => Currencies()
      },
    );
  }
}
