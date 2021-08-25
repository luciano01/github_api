import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_constants.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.github,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.white,
                ),
              ),
              SizedBox(height: 15),
              Text(
                AppConstants.loadingUserData,
                style: AppTextStyles.title14WB,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
