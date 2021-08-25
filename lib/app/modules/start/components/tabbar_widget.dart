import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_constants.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class TabbarWidget extends StatelessWidget {
  final TabController tabController;
  final void Function(int)? onTap;
  final int repositoriesLenght;
  final int starredsLength;
  const TabbarWidget({
    Key? key,
    required this.tabController,
    required this.onTap,
    required this.repositoriesLenght,
    required this.starredsLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey,
            width: 0.8,
          ),
        ),
      ),
      child: TabBar(
        isScrollable: false,
        controller: tabController,
        indicatorColor: AppColors.github,
        unselectedLabelStyle: AppTextStyles.title14GN,
        labelStyle: AppTextStyles.title14BB,
        indicatorWeight: 5,
        onTap: onTap,
        tabs: <Tab>[
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppConstants.tabRepos.toUpperCase()),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$repositoriesLenght',
                    style: AppTextStyles.title14BB,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppConstants.tabStarred.toUpperCase()),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$starredsLength',
                    style: AppTextStyles.title14BB,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
