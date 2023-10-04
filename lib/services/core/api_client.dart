import 'package:dio/dio.dart';

import '../../utils/app_locator.dart';
import 'navigation_service.dart';

class ApiClient {
  final Dio dio;
  NavigationService navigationService = getIt<NavigationService>();

  ApiClient() : dio = Dio(BaseOptions(
    baseUrl: "https://reqres.in/api",
  ));
}