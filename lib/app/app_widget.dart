import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github API',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
    ).modular();
  }
}
