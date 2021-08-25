import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/user_profile/userProfile_store.dart';
import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/user_model.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_constants.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class UserProfilePage extends StatefulWidget {
  final UserModel? userProfile;
  const UserProfilePage({
    Key? key,
    required this.userProfile,
  }) : super(key: key);
  @override
  UserProfilePageState createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage> {
  final UserProfileStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: widget.userProfile!.id!,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.userProfile!.avatarUrl!),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.github,
                          width: 4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.userProfile!.name!,
                    style: AppTextStyles.title18BB,
                  ),
                  Text(
                    '@${widget.userProfile!.login!}',
                    style: AppTextStyles.title14BN,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.userProfile!.bio!,
                    style: AppTextStyles.title16BN,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${widget.userProfile!.publicRepos}',
                            style: AppTextStyles.title18BB,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Public Repos',
                            style: AppTextStyles.title14BN,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${widget.userProfile!.followers}',
                            style: AppTextStyles.title18BB,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Followers',
                            style: AppTextStyles.title14BN,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${widget.userProfile!.following}',
                            style: AppTextStyles.title18BB,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Following',
                            style: AppTextStyles.title14BN,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Location'),
                    subtitle: Text(
                      widget.userProfile!.location ?? 'No Location',
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.public),
                    title: Text('Blog'),
                    subtitle: Text(widget.userProfile!.blog ?? 'No Blog'),
                    trailing: IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        print(widget.userProfile!.blog!);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 16),
                  child: TextButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: AppColors.github,
                          ),
                        ),
                      ),
                    ),
                    icon:
                        Image.asset('assets/images/githubBlack.png', width: 20),
                    label: Text(
                      AppConstants.seeFullProfileButotn,
                      style: AppTextStyles.title18BN,
                    ),
                    onPressed: () {
                      print(widget.userProfile!.htmlUrl!);
                    },
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
