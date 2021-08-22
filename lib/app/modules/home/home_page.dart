import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/user_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          store.getUser(user: 'luciano01');
        },
      ),
      body: Observer(
        builder: (_) {
          UserModel? userModel = store.userProfile;

          if (userModel == null) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    userModel.avatarUrl!,
                  ),
                ),
                Text(userModel.name!),
                Text(userModel.login!),
                Text(userModel.bio!),
                Text(userModel.location!),
              ],
            ),
          );
        },
      ),
    );
  }
}
