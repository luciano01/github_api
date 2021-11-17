import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FormFieldController extends Disposable {
  final _controller = TextEditingController();

  get controller => _controller;

  void get clean => _controller.clear();

  String get text => _controller.text;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? validateUserName(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 3 ||
        value.contains('@')) {
      autovalidateMode = AutovalidateMode.always;
      return 'Invalid username. Try gain!';
    } else {
      return null;
    }
  }

  @override
  FutureOr onDispose() {
    _controller.dispose();
  }
}
