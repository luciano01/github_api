import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/repository_model.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_images.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class ListItemWidget extends StatelessWidget {
  final RepositoryModel repository;
  const ListItemWidget({
    Key? key,
    required this.repository,
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
            repository.fullName ?? 'Full Name',
            style: AppTextStyles.title18BlueB,
          ),
          SizedBox(height: 10),
          Text(
            repository.description ?? 'No Description',
            style: AppTextStyles.title12BN,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.code, color: AppColors.github),
                  SizedBox(width: 5),
                  Text(repository.language ?? 'No Language'),
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  Image.asset(AppImages.githubFork, width: 24),
                  SizedBox(width: 5),
                  Text('${repository.forksCount}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
