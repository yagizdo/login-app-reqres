import 'package:get_it/get_it.dart';

import '../services/auth/auth_service.dart';
import '../services/core/navigation_service.dart';
import '../services/core/network/network_manager.dart';

final GetIt getIt = GetIt.instance;

void setup() {

  // Network Manager
  getIt.registerLazySingleton(() => NetworkManager());

  // Navigation Service
  getIt.registerLazySingleton(() => NavigationService());

  // Auth Service
  getIt.registerLazySingleton(() => AuthService());
}