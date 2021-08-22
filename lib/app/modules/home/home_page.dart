import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:github_api/app/shared/models/repository_model.dart';
import 'package:github_api/app/shared/models/starred_model.dart';
import 'package:github_api/app/shared/models/user_model.dart';
import 'package:github_api/app/shared/utils/app_colors.dart';
import 'package:github_api/app/shared/utils/app_text_styles.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  var overlayLoading = OverlayEntry(
    builder: (BuildContext context) {
      return AlertDialog(
        content: Wrap(
          children: [
            Center(
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 15),
                  Text('Loading data...'),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );

  @override
  void initState() {
    reaction<bool>((_) => (store.isLoading), (isLoading) {
      if (isLoading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });
    super.initState();
  }

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
          var repos = store.listOfRepositories.value;
          var reposError = store.listOfRepositories.error;
          var starreds = store.listOfStarreds.value;
          var starredsError = store.listOfStarreds.error;
          UserModel? userProfile = store.userProfile;

          if (userProfile == null || repos == null || starreds == null) {
            return Center(
              child: Text('Please search for a user profile!'),
            );
          }

          if (reposError != null || starredsError != null) {
            return Center(
              child: Text('Oops! Something wrong!'),
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(userProfile.name!),
                subtitle: Text(userProfile.bio!),
              ),
              ListTile(
                title: Text('${repos.length}'),
                subtitle: Text('${repos.length}'),
              ),
              Text('Repos (${repos.length})'),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: repos.length,
                  itemBuilder: (BuildContext context, int index) {
                    RepositoryModel repository = repos[index];
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(repository.name!),
                          Text(repository.fullName!),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text('Starred (${starreds.length})'),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: starreds.length,
                  itemBuilder: (BuildContext context, int index) {
                    StarredModel starred = starreds[index];
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(starred.name!),
                          Text(starred.fullName!),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
