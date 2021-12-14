import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:github_api/features/github_search/presentation/pages/home_page.dart';
import 'package:github_api/features/github_search/presentation/pages/launch_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LaunchPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}
