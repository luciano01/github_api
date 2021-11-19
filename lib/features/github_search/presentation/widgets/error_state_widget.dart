import 'package:flutter/material.dart';
import 'package:github_api/core/error/failures.dart';

class ErrorStateWidget extends StatelessWidget {
  final Failure message;
  const ErrorStateWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message.props.toString()),
    );
  }
}
