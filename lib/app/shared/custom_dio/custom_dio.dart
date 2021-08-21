import 'package:dio/dio.dart';
import 'package:github_api/app/shared/utils/app_url_base.dart';

class CustomDio {
  late Dio _dio;

  CustomDio() {
    _dio = Dio();
    _dio.options.baseUrl = AppUrlBase.appUrlBase;
  }

  Dio get instance => _dio;
}
