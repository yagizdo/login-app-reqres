import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/core/network/network_provider.dart';
import 'utils/app_locator.dart';
import 'utils/app_routes.dart';
import 'views/network_error_view.dart';

final RouterConfig<Object>? _router = AppRoutes.shared.appRouterConfig();

Future<void> init() async {
  setup();
}

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NetworkProvider()),
      ],
      child: Builder(
        builder: (context) {
          return StreamBuilder(
              stream: context.watch<NetworkProvider>().networkStatusStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == false) {
                  return MaterialApp(
                      builder: (context, child) {
                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                          child: child!,
                        );
                      },
                      title: "Case App",
                      home: const NetworkErrorView());
                }
                return MaterialApp.router(
                  builder: (context, child) {
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child!,
                    );
                  },
                  routerConfig: _router,
                  title: 'Case App',
                );
              });
        },
      ),
    );
  }
}
