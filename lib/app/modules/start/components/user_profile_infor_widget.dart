import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/user_model.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class UserProfileInforWidget extends StatelessWidget {
  final UserModel? userProfile;
  const UserProfileInforWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              userProfile!.avatarUrl!,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userProfile?.name ?? 'No Name',
                  style: AppTextStyles.userTitle,
                ),
                Text(
                  userProfile?.bio ?? 'No Bio',
                  style: AppTextStyles.userSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
