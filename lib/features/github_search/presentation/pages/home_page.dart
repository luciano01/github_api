import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:github_api/core/error/failures.dart';
import 'package:github_api/features/github_search/presentation/store/repos_store.dart';
import 'package:github_api/features/github_search/presentation/store/states/store_state.dart';
import 'package:github_api/features/github_search/presentation/controller/form_field_controller.dart';
import 'package:github_api/features/github_search/presentation/widgets/custom_app_bar.dart';
import 'package:github_api/features/github_search/presentation/widgets/error_state_widget.dart';
import 'package:github_api/features/github_search/presentation/widgets/start_state_widget.dart';
import 'package:github_api/features/github_search/presentation/widgets/loading_state_widget.dart';
import 'package:github_api/features/github_search/presentation/widgets/search_field.dart';
import 'package:github_api/features/github_search/presentation/widgets/search_results.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = GetIt.instance.get<ReposStore>();
  final formFieldController = FormFieldController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Observer(builder: (_) {
              var state = store.state;

              if (state is ErrorState) {
                return ErrorStateWidget(
                  message: ServerFailure('ServerFailure'),
                );
              }

              if (state is StartState) {
                return StartStateWidget();
              } else if (state is LoadingState) {
                return LoadingStateWidget();
              } else if (state is SuccessState) {
                return SearchResults(repos: state.list);
              } else {
                return Container();
              }
            }),
          ),
          SearchField(
            formKey: _formKey,
            autovalidateMode: formFieldController.autovalidateMode,
            validator: formFieldController.validateUserName,
            controller: formFieldController.controller,
            onPressedSearch: () {
              if (_formKey.currentState!.validate()) {
                FocusScope.of(context).requestFocus(FocusNode());
                store.getUserRepositories(userName: formFieldController.text);
              }
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ],
      ),
    );
  }
}
