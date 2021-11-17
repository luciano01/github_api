import 'package:flutter/material.dart';
import 'package:github_api/core/utils/app_colors.dart';

class AppTextStyles {
  static final fullNameStyle = TextStyle(
    color: AppColors.blue500,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static final descriptionStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  static final languageStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
  );
  static final forksStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
  );

  static final initialStateStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 18,
  );
  static final loadingStateStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
}
