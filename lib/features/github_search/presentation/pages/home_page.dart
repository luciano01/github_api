import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:github_api/core/utils/store_state.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';
import 'package:github_api/features/github_search/presentation/store/repos_store.dart';
import 'package:github_api/features/github_search/presentation/widgets/custom_app_bar.dart';
import 'package:github_api/features/github_search/presentation/widgets/initial_state.dart';
import 'package:github_api/features/github_search/presentation/widgets/loading_state.dart';
import 'package:github_api/features/github_search/presentation/widgets/search_field.dart';
import 'package:github_api/features/github_search/presentation/widgets/search_results.dart';

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
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Observer(builder: (_) {
              List<Repos> repos = store.userRepositories;

              if (store.state == StoreState.initial) {
                return InitialState();
              }

              if (store.state == StoreState.loading) {
                return LoadingState();
              }

              if (store.state == StoreState.loaded) {
                return SearchResults(repos: repos);
              } else {
                return Container();
              }
            }),
          ),
          SearchField(
            onPressedSearch: () {
              store.getUserRepositories(userName: 'luciano01');
            },
            onPressedClean: () {},
          ),
        ],
      ),
    );
  }
}
