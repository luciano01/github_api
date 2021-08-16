import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/home/home_store.dart';
import 'package:github_api/app/shared/models/repository_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github API'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              store.getRepositories();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          store.getRepositories(user: 'luciano01');
        },
      ),
      body: Observer(
        builder: (_) {
          var repositories = store.listOfRepositories.value;
          var error = store.listOfRepositories.error;

          if (repositories == null || repositories.isEmpty) {
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black,
              ),
            ));
          }

          if (error != null) {
            return Center(child: Text('Oops! Something wrong!'));
          }

          return ListView.builder(
            itemCount: repositories.length,
            itemBuilder: (_, index) {
              RepositoryModel repository = repositories[index];
              return ListTile(
                title: Text(repository.name!),
                subtitle: Text(repository.description ?? 'No Description'),
              );
            },
          );
        },
      ),
    );
  }
}
