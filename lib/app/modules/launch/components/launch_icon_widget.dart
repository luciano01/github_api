import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_images.dart';

class LaunchIconWidget extends StatelessWidget {
  const LaunchIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.github,
      width: 120,
    );
  }
}
