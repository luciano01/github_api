import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle appBarTitle = GoogleFonts.openSans(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle appBarSubtitle = GoogleFonts.openSans(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle userTitle = GoogleFonts.openSans(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle userSubtitle = GoogleFonts.openSans(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle tabTitleActivate = GoogleFonts.openSans(
    color: AppColors.slateGrey,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle tabTitleDeactivate = GoogleFonts.openSans(
    color: AppColors.slateGrey,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle tabQuantity = GoogleFonts.openSans(
    color: AppColors.slateGrey,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bottomSheetTitle = GoogleFonts.openSans(
    color: AppColors.slateGrey,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle repoTitle = GoogleFonts.openSans(
    color: AppColors.reposTitle,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle repoSubtitle = GoogleFonts.openSans(
    color: AppColors.appBarColor,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle loadingData = GoogleFonts.openSans(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
