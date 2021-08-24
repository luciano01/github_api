import 'package:flutter/material.dart';
import 'package:github_api/app/modules/start/pages/repos/components/list_item_widget.dart';
import 'package:github_api/app/shared/models/repository_model.dart';

class ReposPage extends StatefulWidget {
  final List list;
  const ReposPage({
    Key? key,
    required this.list,
  }) : super(key: key);
  @override
  ReposPageState createState() => ReposPageState();
}

class ReposPageState extends State<ReposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            RepositoryModel repository = widget.list[index];
            return ListItemWidget(repository: repository);
          },
        ),
      ),
    );
  }
}
