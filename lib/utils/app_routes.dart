import 'package:login_app_riverpod/utils/app_locator.dart';
import 'package:login_app_riverpod/views/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/core/navigation_service.dart';
import '../views/error_view.dart';

class AppRoutes {

  AppRoutes._();

  static final shared = AppRoutes._();

  factory AppRoutes() => shared;

  static const splash = '/';
  static const home = '/home';

  List<RouteBase> appRoutes = [
    GoRoute(
      path: splash,
      builder: (context, state) => const HomeView(),
    ),
  ];

  RouterConfig<Object>? appRouterConfig() {
    return GoRouter(
        navigatorKey: getIt<NavigationService>().navigatorKey,
        errorBuilder: (context, state) => ErrorView(errorValue: state.error?.message,),routes: appRoutes);
  }

}