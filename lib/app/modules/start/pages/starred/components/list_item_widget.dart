import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/starred_model.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class ListItemWidget extends StatelessWidget {
  final StarredModel starred;
  const ListItemWidget({
    Key? key,
    required this.starred,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Icon(Icons.star, color: AppColors.primaryColor),
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
  }
}
