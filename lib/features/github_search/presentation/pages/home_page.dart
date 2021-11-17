import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:github_api/core/utils/store_state.dart';
import 'package:github_api/features/github_search/presentation/store/repos_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = GetIt.instance.get<ReposStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          store.getUserRepositories(userName: 'luciano01');
        },
      ),
      body: Observer(builder: (_) {
        var repos = store.userRepositories;

        if (store.state == StoreState.initial) {
          return Center(child: Text('Pesquisa aí véi!'));
        }

        if (store.state == StoreState.loading) {
          return Center(child: CircularProgressIndicator());
        }

        if (store.state == StoreState.loaded) {
          return ListView.builder(
            itemCount: repos.length,
            itemBuilder: (context, index) {
              var repo = repos[index];
              return ListTile(
                title: Text(repo.fullName),
              );
            },
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
