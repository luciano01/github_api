import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
