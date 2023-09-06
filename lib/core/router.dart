import 'package:git_hub_card/data/repository/github_repo_repository_impl.dart';
import 'package:git_hub_card/data/repository/github_repository_impl.dart';
import 'package:git_hub_card/data/repository/logo_repository_impl.dart';
import 'package:git_hub_card/domain/model/current_user.dart';
import 'package:git_hub_card/domain/model/logo.dart';
import 'package:git_hub_card/presentation/login/login_view_model.dart';
import 'package:git_hub_card/presentation/card/card_view_model.dart';
import 'package:git_hub_card/presentation/login/login_screen.dart';
import 'package:git_hub_card/presentation/card/card_screen.dart';
import 'package:git_hub_card/data/login/github_login.dart';
import 'package:git_hub_card/core/auth/auth_provider.dart';
import 'package:git_hub_card/data/api/devicon_api.dart';
import 'package:git_hub_card/presentation/profile/profile_screen.dart';
import 'package:git_hub_card/presentation/profile/profile_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AuthProvider()),
            ChangeNotifierProvider(create: (context) => LoginViewModel()),
          ],
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) {
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
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) {
        final currentUser =
            (state.extra! as Map<String, Object>)['currentUser'] as CurrentUser;
        final logos =
            (state.extra! as Map<String, Object>)['logos'] as List<Logo>;

        // return ProfileScreen(currentUser: currentUser);
        return ChangeNotifierProvider(
          create: (_) => ProfileViewModel(),
          child: ProfileScreen(currentUser: currentUser, logos: logos),
        );
      },
    ),
  ],
);
