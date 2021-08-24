import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
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
        color: AppColors.deactivateTab.withOpacity(0.0),
        border: Border(
          bottom: BorderSide(
            color: AppColors.deactivateTab,
            width: 0.8,
          ),
        ),
      ),
      child: TabBar(
        isScrollable: false,
        controller: tabController,
        indicatorColor: AppColors.rustyOrange,
        unselectedLabelStyle: AppTextStyles.tabTitleDeactivate,
        labelStyle: AppTextStyles.tabTitleActivate,
        indicatorWeight: 5,
        onTap: onTap,
        tabs: <Tab>[
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Repos'),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteTwo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('$repositoriesLenght'),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Starred'),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteTwo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('$starredsLength'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
