// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'package:example/features/getting_started/getting_started_screen.dart';
import 'package:example/features/guide/guide_screen.dart';
import 'package:example/features/log/log_screen.dart';
import 'package:example/features/scan/scan_screen.dart';
import 'package:example/features/scan/scan_screen_bloc.dart';
import 'package:example/features/view_product/view_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:go_router/go_router.dart';
import 'package:helixworlds_snatcher_sdk/theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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

Future<String> _getModel(String assetPath) async {
    // if (io.Platform.isAndroid) {
    //   return 'flutter_assets/$assetPath';
    // }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final modelPath = await _getModel("assets/model.tflite");
  final options = LocalLabelerOptions(modelPath: modelPath);
  setupServices(options, mixPanelToken: "c680bac0fb6044d20faaa729a54cb081");
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

