import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      title: 'Flutter Helixworlds SDK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScanScreenWidget.builder(context),
    );
  }
}

