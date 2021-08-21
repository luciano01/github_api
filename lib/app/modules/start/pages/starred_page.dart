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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 50,
          itemBuilder: (context, index) {
            return Text('Starred #${index + 1}');
          },
        ),
      ),
    );
  }
}
