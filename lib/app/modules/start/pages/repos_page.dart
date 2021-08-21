import 'package:flutter/material.dart';

class ReposPage extends StatefulWidget {
  const ReposPage({Key? key}) : super(key: key);
  @override
  ReposPageState createState() => ReposPageState();
}

class ReposPageState extends State<ReposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Repos'),
          ),
        ],
      ),
    );
  }
}
