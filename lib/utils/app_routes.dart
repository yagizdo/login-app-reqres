import 'package:login_app_riverpod/utils/app_locator.dart';
import 'package:login_app_riverpod/views/auth/view/login_view.dart';
import 'package:login_app_riverpod/views/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app_riverpod/views/splash_view.dart';

import '../services/core/navigation_service.dart';
import '../views/error_view.dart';

class AppRoutes {

  AppRoutes._();

  static final shared = AppRoutes._();

  factory AppRoutes() => shared;

  static const splash = '/';
  static const home = '/home';
  static const login = '/login';

  List<RouteBase> appRoutes = [
    GoRoute(
      path: splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: login,
      builder: (context, state) => const LoginView(),
    ),
  ];

  RouterConfig<Object>? appRouterConfig() {
    return GoRouter(
        navigatorKey: getIt<NavigationService>().navigatorKey,
        errorBuilder: (context, state) => ErrorView(errorValue: state.error?.message,),routes: appRoutes);
  }

}