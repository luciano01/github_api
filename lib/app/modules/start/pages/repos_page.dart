import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/repository_model.dart';

class ReposPage extends StatefulWidget {
  final List<RepositoryModel> list;
  const ReposPage({Key? key, required this.list}) : super(key: key);
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
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            RepositoryModel repository = widget.list[index];
            return ListTile(
              title: Text(repository.name!),
              subtitle: Text(repository.fullName!),
            );
          },
        ),
      ),
    );
  }
}
