import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api/core/utils/app_colors.dart';
import 'package:github_api/core/utils/app_images.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Get.offNamed('/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.github,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.githubWhiteImg, width: 180),
                SizedBox(height: 5),
                Text(
                  'GitHub API',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Search User Repositories',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
