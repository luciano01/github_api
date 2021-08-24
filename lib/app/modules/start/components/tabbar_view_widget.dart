import 'package:flutter/material.dart';
import 'package:github_api/app/modules/start/pages/repos/repos_page.dart';
import 'package:github_api/app/modules/start/pages/starred/starred_page.dart';

class TabbarViewWidget extends StatelessWidget {
  final int? index;
  final List<dynamic> repositories;
  final List<dynamic> starreds;
  const TabbarViewWidget({
    Key? key,
    required this.index,
    required this.repositories,
    required this.starreds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: index,
        children: [
          ReposPage(list: repositories),
          StarredPage(list: starreds),
        ],
      ),
    );
  }
}
