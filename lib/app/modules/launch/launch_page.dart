import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/launch/components/launch_app_name_widget.dart';
import 'package:github_api/app/modules/launch/components/launch_icon_widget.dart';
import 'package:github_api/app/modules/launch/launch_store.dart';
import 'package:flutter/material.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);
  @override
  LaunchPageState createState() => LaunchPageState();
}

class LaunchPageState extends State<LaunchPage> {
  final LaunchStore store = Modular.get();

  @override
  void initState() {
    store.waitAndSwitchToStartModule();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LaunchIconWidget(),
              SizedBox(height: 20),
              LaunchAppNameWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
