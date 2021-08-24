import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/start/pages/repos_page.dart';
import 'package:github_api/app/modules/start/pages/starred_page.dart';
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
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.appBarColor,
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
                  'Loading user data...',
                  style: AppTextStyles.loadingData,
                ),
              ],
            ),
          ),
        ),
      );
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
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Expanded(child: Text(store.errorMessage!)),
              ],
            ),
            action: SnackBarAction(
              label: 'Try Again',
              textColor: Colors.white,
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
        backgroundColor: AppColors.appBarColor,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(AppImages.github, width: 30),
            SizedBox(width: 15),
            Text('Github ', style: AppTextStyles.appBarTitle),
            Text('profiles', style: AppTextStyles.appBarSubtitle),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.search),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Form(
                key: _formKey,
                autovalidateMode: store.autovalidateMode,
                child: Container(
                  padding: MediaQuery.of(context).viewInsets,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Wrap(
                      children: [
                        Center(
                          child: Text(
                            AppConstants.bottomSheetTitle,
                            style: AppTextStyles.bottomSheetTitle,
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: AppConstants.textFormFieldHintText,
                                  prefixIcon: Icon(Icons.person),
                                ),
                                validator: store.validateUsername,
                                onChanged: store.setUsername,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            SizedBox(width: 15),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(Icons.send),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  store
                                      .getUserData(username: store.username)
                                      .then((_) {
                                    store.setErrorMessage(null);
                                  });
                                  FocusScope.of(context).unfocus();
                                  Modular.to.pop();
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Observer(builder: (_) {
        var repositories = store.listOfRepositories.value ?? [];
        var starreds = store.listOfStarreds.value ?? [];
        UserModel? userProfile = store.userProfile;
        var errorStarreds = store.listOfStarreds.error;
        var errorRepositories = store.listOfRepositories.error;

        if (userProfile == null) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.appBarColor,
              ),
            ),
          );
        }

        if (errorStarreds != null || errorRepositories != null) {
          return Center(child: Text('Oops! Something wrong!'));
        }

        return Column(
          children: [
            userInfor(userProfile: userProfile),
            tabBar(
              _tabController!,
              (index) {
                setState(() {
                  currentIndex = index;
                  _tabController?.animateTo(index);
                });
              },
              repositories.length,
              starreds.length,
            ),
            Expanded(
              child: IndexedStack(
                index: _tabController!.index,
                children: [
                  ReposPage(list: repositories),
                  StarredPage(list: starreds),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

Widget userInfor({UserModel? userProfile}) {
  return Container(
    color: AppColors.appBarColor,
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
                userProfile.name ?? 'No Name',
                style: AppTextStyles.userTitle,
              ),
              Text(
                userProfile.bio ?? 'No Bio',
                style: AppTextStyles.userSubtitle,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget tabBar(
  TabController _tabController,
  void Function(int)? onTap,
  int repositoriesLenght,
  int starredsLength,
) {
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
      controller: _tabController,
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
