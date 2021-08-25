import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_constants.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class LaunchAppNameWidget extends StatelessWidget {
  const LaunchAppNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppConstants.launchAppName,
      style: AppTextStyles.title32WN,
    );
  }
}
