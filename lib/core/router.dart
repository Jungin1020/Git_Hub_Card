import 'package:git_hub_card/data/repository/github_repo_repository_impl.dart';
import 'package:git_hub_card/data/repository/github_repository_impl.dart';
import 'package:git_hub_card/data/repository/logo_repository_impl.dart';
import 'package:git_hub_card/presentation/login/login_view_model.dart';
import 'package:git_hub_card/presentation/card/card_view_model.dart';
import 'package:git_hub_card/presentation/login/login_screen.dart';
import 'package:git_hub_card/presentation/card/card_screen.dart';
import 'package:git_hub_card/data/login/github_login.dart';
import 'package:git_hub_card/core/auth/auth_provider.dart';
import 'package:git_hub_card/data/api/devicon_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final FirebaseAuth _auth = FirebaseAuth.instance;

        final user = _auth.currentUser;

        if (user != null) {
          // Firebase에 로그인한 경우 CardScreen을 표시합니다.
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => AuthProvider()),
              ChangeNotifierProvider(
                create: (context) => CardViewModel(
                  GithubRepositoryImpl(),
                  GithubLogin(),
                  GithubRepoRepositoryImpl(),
                  LogoRepositoryImpl(DeviconApi()),
                ),
              ),
            ],
            child: const CardScreen(),
          );
        } else {
          // Firebase에 로그인하지 않은 경우 LoginScreen을 표시합니다.
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => AuthProvider()),
              ChangeNotifierProvider(create: (context) => LoginViewModel()),
            ],
            child: const LoginScreen(),
          );
        }
      },
    ),
  ],
);
