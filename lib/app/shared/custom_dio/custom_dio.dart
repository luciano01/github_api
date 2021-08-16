import 'package:dio/dio.dart';
import 'package:github_api/app/shared/constants/url_base.dart';

class CustomDio {
  late Dio _dio;

  CustomDio() {
    _dio = Dio();
    _dio.options.baseUrl = UrlBase.urlBase;
  }

  Dio get instance => _dio;
}
