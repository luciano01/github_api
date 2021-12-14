import 'package:flutter/material.dart';
import 'package:github_api/core/utils/app_images.dart';
import 'package:github_api/core/utils/app_text_styles.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key? key,
    required this.repo,
  }) : super(key: key);

  final Repos repo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 4,
        top: 4,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                repo.fullName,
                style: AppTextStyles.fullNameStyle,
              ),
              SizedBox(height: 10),
              Text(
                repo.description,
                style: AppTextStyles.descriptionStyle,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.code),
                      Text(
                        repo.language,
                        style: AppTextStyles.languageStyle,
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Image.asset(AppImages.forkImg, width: 20),
                      Text(
                        '${repo.forksCount}',
                        style: AppTextStyles.forksStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
