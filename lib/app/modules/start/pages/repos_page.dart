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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 50,
          itemBuilder: (context, index) {
            return Text('Repos #${index + 1}');
          },
        ),
      ),
    );
  }
}
