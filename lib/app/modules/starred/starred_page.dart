import 'package:flutter/material.dart';

class StarredPage extends StatefulWidget {
  final String title;
  const StarredPage({Key? key, this.title = 'StarredPage'}) : super(key: key);
  @override
  StarredPageState createState() => StarredPageState();
}

class StarredPageState extends State<StarredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
