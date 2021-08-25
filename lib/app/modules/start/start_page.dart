import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/start/components/app_bar_title_widget.dart';
import 'package:github_api/app/modules/start/components/loading_list_widget.dart';
import 'package:github_api/app/modules/start/components/search_fab_widget.dart';
import 'package:github_api/app/modules/start/components/tabbar_view_widget.dart';
import 'package:github_api/app/modules/start/components/tabbar_widget.dart';
import 'package:github_api/app/modules/start/components/user_profile_infor_widget.dart';
import 'package:github_api/app/modules/start/start_store.dart';
import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/user_model.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_constants.dart';
import 'package:github_api/app/shared/utils/app_images.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';
import 'package:mobx/mobx.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> with TickerProviderStateMixin {
  final StartStore store = Modular.get();

  TabController? _tabController;
  int currentIndex = 0;

  final _formKey = GlobalKey<FormState>();

  var overlayLoading = OverlayEntry(
    builder: (BuildContext context) {
      return LoadingListWidget();
    },
  );

  @override
  void initState() {
    store.getUserData(username: 'luciano01');
    _tabController = TabController(
      initialIndex: currentIndex,
      length: 2,
      vsync: this,
    );

    reaction<bool>((_) => (store.isLoading), (isLoading) {
      if (isLoading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    reaction((_) => store.errorMessage, (hasError) {
      if (hasError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
            content: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: AppColors.white,
                ),
                SizedBox(width: 10),
                Expanded(child: Text(store.errorMessage!)),
              ],
            ),
            action: SnackBarAction(
              label: AppConstants.tryAgain,
              textColor: AppColors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.github,
        elevation: 0,
        title: AppBarTitleWidget(),
      ),
      floatingActionButton: SearchFabWidget(
        validator: store.validateUsername,
        onChanged: store.setUsername,
        formKey: _formKey,
        autovalidateMode: store.autovalidateMode,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            store.getUserData(username: store.username).then((_) {
              store.setErrorMessage(null);
            });
            FocusScope.of(context).unfocus();
            Modular.to.pop();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Observer(builder: (_) {
        var repositories = store.listOfRepositories.value ?? [];
        var starreds = store.listOfStarreds.value ?? [];
        UserModel? userProfile = store.userProfile;
        var errorStarreds = store.listOfStarreds.error;
        var errorRepositories = store.listOfRepositories.error;

        if (userProfile == null || repositories == null || starreds == null) {
          return LoadingListWidget();
        }

        if (errorStarreds != null || errorRepositories != null) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.github,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.githubOctocat, width: 220),
                  SizedBox(height: 15),
                  Text(
                    AppConstants.error.toUpperCase(),
                    style: AppTextStyles.title16WN,
                  ),
                  SizedBox(height: 15),
                  Text(
                    AppConstants.tryAgain.toUpperCase(),
                    style: AppTextStyles.title16WB,
                  ),
                ],
              ),
            ),
          );
        }

        return Column(
          children: [
            UserProfileInforWidget(userProfile: userProfile),
            TabbarWidget(
              tabController: _tabController!,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  _tabController?.animateTo(index);
                });
              },
              repositoriesLenght: repositories.length,
              starredsLength: starreds.length,
            ),
            TabbarViewWidget(
              index: _tabController!.index,
              repositories: repositories,
              starreds: starreds,
            ),
          ],
        );
      }),
    );
  }
}
