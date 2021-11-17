import 'package:flutter/material.dart';
import 'package:github_api/core/utils/app_colors.dart';
import 'package:github_api/core/utils/app_const.dart';
import 'package:github_api/core/utils/app_text_styles.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.black),
        ),
        SizedBox(height: 15),
        Text(
          AppConst.stateLoading,
          textAlign: TextAlign.center,
          style: AppTextStyles.loadingStateStyle,
        ),
      ],
    ));
  }
}
