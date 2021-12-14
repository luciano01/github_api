import 'package:flutter/material.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';
import 'package:github_api/features/github_search/presentation/widgets/list_item_widget.dart';

class SearchResults extends StatelessWidget {
  final List<Repos> repos;
  const SearchResults({Key? key, required this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          var repo = repos[index];
          return ListItemWidget(repo: repo);
        },
      ),
    );
  }
}
