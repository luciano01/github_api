import 'package:flutter/material.dart';

class ReposPage extends StatefulWidget {
  final String title;
  const ReposPage({Key? key, this.title = 'ReposPage'}) : super(key: key);
  @override
  ReposPageState createState() => ReposPageState();
}

class ReposPageState extends State<ReposPage> {
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
