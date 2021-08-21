import 'package:flutter/material.dart';

class StarredPage extends StatefulWidget {
  const StarredPage({Key? key}) : super(key: key);
  @override
  StarredPageState createState() => StarredPageState();
}

class StarredPageState extends State<StarredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Starred'),
          ),
        ],
      ),
    );
  }
}
