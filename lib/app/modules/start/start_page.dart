import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/start/start_store.dart';
import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_images.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> with TickerProviderStateMixin {
  final StartStore store = Modular.get();

  TabController? _tabController;
  int selectedIndex = 0;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: selectedIndex,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Row(
          children: [
            Image.asset(AppImages.github, width: 30),
            SizedBox(width: 15),
            Text('Github ', style: AppTextStyles.appBarTitle),
            Text('profiles', style: AppTextStyles.appBarSubtitle),
          ],
        ),
      ),
      body: ListView(
        children: [
          textFormField(),
          userInfor(),
          tabBar(_tabController!, (index) {
            setState(() {
              selectedIndex = index;
            });
          }),
          <Widget>[
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Text('Repos #${index + 1}');
                },
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Text('Starred #${index + 1}');
                },
              ),
            ),
          ][_tabController!.index]
        ],
      ),
    );
  }
}

Widget userInfor() {
  return Container(
    color: AppColors.white,
    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(radius: 30, child: FlutterLogo(size: 50)),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Luciano Martins',
                style: AppTextStyles.userTitle,
              ),
              Text(
                'Flutter Developer',
                style: AppTextStyles.userSubtitle,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget textFormField() {
  return Container(
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Username profile',
      ),
    ),
  );
}

Widget tabBar(
  TabController _tabController,
  void Function(int)? onTap,
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
                child: Text('73'),
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
                child: Text('5'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
