import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/core/router.dart';
import 'package:git_hub_card/presentation/noConnection/noConnectionScreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final connectivityResult = await Connectivity().checkConnectivity();
    bool isConnected = (connectivityResult != ConnectivityResult.none);

    if (isConnected) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      runApp(const MyApp(isConnected: true));
    } else {
      runApp(const MyApp(isConnected: false));
    }
  } catch (e) {
    throw Exception(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isConnected});

  final bool isConnected;

  // bool _isConnected = true;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return switch (isConnected) {
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
