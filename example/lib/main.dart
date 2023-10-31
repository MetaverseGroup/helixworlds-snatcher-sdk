import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/helixworlds_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServices();
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
    return MaterialApp(
      title: 'Flutter Helixworlds SDK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HelixworldsSDK.builder(context),
    );
  }
}

