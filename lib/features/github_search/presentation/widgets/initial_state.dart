import 'package:flutter/material.dart';
import 'package:github_api/core/utils/app_const.dart';
import 'package:github_api/core/utils/app_images.dart';
import 'package:github_api/core/utils/app_text_styles.dart';

class InitialState extends StatelessWidget {
  const InitialState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.octocatImg, width: 180),
          SizedBox(height: 10),
          Text(
            AppConst.stateInitial,
            textAlign: TextAlign.center,
            style: AppTextStyles.initialStateStyle,
          ),
        ],
      ),
    );
  }
}
