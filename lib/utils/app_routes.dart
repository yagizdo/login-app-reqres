import 'package:login_app_riverpod/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        errorBuilder: (context, state) => ErrorView(errorValue: state.error?.message,),routes: appRoutes);
  }

}