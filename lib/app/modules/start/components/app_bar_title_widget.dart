import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_constants.dart';
import 'package:github_api/app/shared/utils/app_images.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppImages.github, width: 30),
        SizedBox(width: 15),
        Text(
          AppConstants.startAppBarTitleGithub,
          style: AppTextStyles.startAppBarTitleGithub,
        ),
        Text(
          AppConstants.startAppBarTitleProfiles,
          style: AppTextStyles.startAppBarTitleProfiles,
        ),
      ],
    );
  }
}
