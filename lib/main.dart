import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/core/router.dart';
import 'package:git_hub_card/presentation/noConnection/noConnectionScreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = (connectivityResult != ConnectivityResult.mobile);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return switch (_isConnected) {
      false => MaterialApp(
          home: const NoConnectionScreen(),
          debugShowCheckedModeBanner: false,
          title: 'GitCard',
          theme: ThemeData(
            useMaterial3: true,
          ),
        ),
      true => MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'GitCard',
          theme: ThemeData(
            useMaterial3: true,
          ),
        ),
    };
  }
}
