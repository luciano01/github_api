import 'package:flutter/material.dart';
import 'package:github_api/core/utils/app_colors.dart';
import 'package:github_api/core/utils/app_const.dart';
import 'package:github_api/core/utils/app_images.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.github,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(AppImages.githubWhiteImg, width: 30),
          SizedBox(width: 15),
          Text(AppConst.appBarTitle),
        ],
      ),
    );
  }
}
