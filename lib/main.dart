import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/core/router.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData.dark(),
      // home: ChangeNotifierProvider(
      //   create: (_) =>
      //       LoginViewModel(GithubRepositoryImpl(FirebaseAuth.instance)),
      //   child: const LoginScreen(),
      // ),
      // home: const LoginScreen(),
    );
  }
}
