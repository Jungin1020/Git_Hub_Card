import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/core/router.dart';
import 'package:git_hub_card/firebase_options.dart';
import 'package:git_hub_card/presentation/noConnection/noConnectionScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  // final connectivityResult = await Connectivity().checkConnectivity();
  // final isConnected = (connectivityResult != ConnectivityResult.none);
  //
  // if (isConnected) {
  //   await Firebase.initializeApp(
  //       // options: DefaultFirebaseOptions.currentPlatform,
  //       );
  //
  //   runApp(const MyApp(isConnected: true));
  // } else {
  //   runApp(const MyApp(isConnected: false));
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final bool isConnected;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'GitCard',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );

    // return switch (isConnected) {
    //   true => MaterialApp.router(
    //       routerConfig: router,
    //       debugShowCheckedModeBanner: false,
    //       title: 'GitCard',
    //       theme: ThemeData(
    //         useMaterial3: true,
    //       ),
    //     ),
    //   false => MaterialApp(
    //       home: const NoConnectionScreen(),
    //       debugShowCheckedModeBanner: false,
    //       title: 'GitCard',
    //       theme: ThemeData(
    //         useMaterial3: true,
    //       ),
    //     ),
    // };
  }
}
