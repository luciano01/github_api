import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/starred_model.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class StarredPage extends StatefulWidget {
  final List list;
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
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            StarredModel starred = widget.list[index];
            return Padding(
              padding: EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    starred.fullName ?? 'Full Name',
                    style: AppTextStyles.repoTitle,
                  ),
                  SizedBox(height: 10),
                  Text(
                    starred.description ?? 'No Description',
                    style: AppTextStyles.repoSubtitle,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: AppColors.appBarColor),
                          SizedBox(width: 5),
                          Text('${starred.stargazersCount}'),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Image.asset('assets/images/fork.png', width: 24),
                          SizedBox(width: 5),
                          Text('${starred.forksCount}'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
