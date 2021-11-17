import 'package:flutter/cupertino.dart';
import 'package:github_api/app_widget.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(AppWidget());
}
