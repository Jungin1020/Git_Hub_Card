import 'package:git_hub_card/data/login/github_login.dart';
import 'package:git_hub_card/data/repository/github_repository_impl.dart';
import 'package:git_hub_card/presentation/card/card_screen.dart';
import 'package:git_hub_card/presentation/login/login_screen.dart';
import 'package:git_hub_card/presentation/login/login_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../presentation/card/card_view_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/card',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => CardViewModel(GithubRepositoryImpl(), GithubLogin()),
          child: const CardScreen(),
        );
      },
    ),
  ],
);
