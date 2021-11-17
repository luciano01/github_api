import 'package:flutter/material.dart';
import 'package:github_api/core/utils/app_images.dart';
import 'package:github_api/core/utils/app_text_styles.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';

class SearchResults extends StatelessWidget {
  final List<Repos> repos;
  const SearchResults({Key? key, required this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: repos.length,
        itemBuilder: (context, index) {
          var repo = repos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
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
          );
        },
      ),
    );
  }
}
