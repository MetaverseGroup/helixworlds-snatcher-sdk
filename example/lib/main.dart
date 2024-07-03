// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:example/const/env_const.dart';
import 'package:example/features/getting_started/getting_started_screen.dart';
import 'package:example/features/guide/guide_screen.dart';
import 'package:example/features/log/log_screen.dart';
import 'package:example/features/scan/scan_screen.dart';
import 'package:example/features/scan/scan_screen_bloc.dart';
import 'package:example/features/view_product/view_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:go_router/go_router.dart';
import 'package:helixworlds_snatcher_sdk/theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final appRouter = GoRouter(
  routes: [ 
    GoRoute(
      path:"/",
      builder: (BuildContext context, GoRouterState state) => const GettingStartedScreen(), 
      routes:[
        GoRoute(
          path:"home",
          builder: (BuildContext context, GoRouterState state) => const HomeScreen(), 
          routes: [
            GoRoute(
              path:"logs",
              builder: (BuildContext context, GoRouterState state) => const LogsScreen(), 
            ),
            GoRoute(
              path:"guide",
              builder: (BuildContext context, GoRouterState state) => const GuidanceScreen(), 
            ),
            GoRoute(
              path:"product_details",
              builder: (BuildContext context, GoRouterState state) => const ViewProductScreen(), 
            ),
          ]
        ),
      ]
    )
  ]
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  setBaseSDKUrl(
    isProd ? dotenv.get('GATHERER_PROD_URL', fallback: 'no gatherer url set') : dotenv.get('GATHERER_DEV_URL', fallback: 'no gatherer url set'), 
    
    isProd ? dotenv.get('INVENTORY_PROD_URL', fallback: 'no inventory url set') : dotenv.get('INVENTORY_DEV_URL', fallback: 'no inventory url set'),

    isProd ? dotenv.get('VALOR_API_PROD_URL', fallback: 'no inventory url set') : dotenv.get('VALOR_API_DEV_URL', fallback: 'no inventory url set') 
  );


  setupServices(
    mixPanelToken: mixPanelToken ?? "",
    arAccessKey: "access key here",
    arSecretKey: "secret key here",
    arRegion: region ?? "",
    rudderPlaneUrl: rudderDataPlaneUrl ?? "",
    rudderStackKey: rudderKey ?? ""
  );
  Future.delayed(const Duration(seconds: 1)).then((_) {
    runZonedGuarded(() async {
      runApp(const MyApp());
    }, (exception, stackTrace) async {
      // captureException(exception, stackTrace);
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScanScreenPageBloc>(
        create: (context) => ScanScreenPageBloc(getSDK()),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          bloc: getThemeBloc(),
          builder: (context, state) {
            

            return MaterialApp.router(
              theme: theme,
              title: 'Helixworlds',
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
            );
          })
    );
  }
}

