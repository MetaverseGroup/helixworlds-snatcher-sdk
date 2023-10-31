// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/getting_started/getting_started_screen.dart';
import 'package:helixworlds_snatcher_sdk/features/guide/guide_screen.dart';
import 'package:helixworlds_snatcher_sdk/features/log/log_screen.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helixworlds_snatcher_sdk/features/view_product/view_product_screen.dart';
import 'package:helixworlds_snatcher_sdk/theme/bloc/theme_bloc.dart';
import 'package:go_router/go_router.dart';

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

class HelixworldsSDK{
  /// call this to do lookup on local data item
  static Widget builder(BuildContext context) {
    return BlocProvider<ScanScreenPageBloc>(
        create: (context) => ScanScreenPageBloc(getUserDetailsRepo(), getLogLocalDS(), scanRepository(), getImagePicker(), getHelperUtil(), isLocalItemDetailsFetch: true),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          bloc: getThemeBloc(),
          builder: (context, state) {
            return MaterialApp.router(
              theme: theme,
              title: 'Helixworlds',
              // navigatorKey: NavigatorService.navigatorKey,
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
            );
          })
    );
  }
  
  /// call this to do look up on inventory api for the item
  static Widget builderInventory(BuildContext context) {
    return BlocProvider<ScanScreenPageBloc>(
        create: (context) => ScanScreenPageBloc(getUserDetailsRepo(), getLogLocalDS(), scanRepository(), getImagePicker(), getHelperUtil(), isLocalItemDetailsFetch: false),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          bloc: getThemeBloc(),
          builder: (context, state) {
            
            return MaterialApp.router(
              theme: theme,
              title: 'Helixworlds',
              // navigatorKey: NavigatorService.navigatorKey,
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
            );
          })
    );
  } 
}