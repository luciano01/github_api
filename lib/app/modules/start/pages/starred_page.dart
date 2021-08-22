import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/starred_model.dart';

class StarredPage extends StatefulWidget {
  final List<StarredModel> list;
  const StarredPage({
    Key? key,
    required this.list,
  }) : super(key: key);
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
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            StarredModel starred = widget.list[index];
            return ListTile(
              title: Text(starred.name!),
              subtitle: Text(starred.fullName!),
            );
          },
        ),
      ),
    );
  }
}
