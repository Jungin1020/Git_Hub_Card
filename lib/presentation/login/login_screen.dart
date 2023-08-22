import 'package:flutter/material.dart';
import 'package:git_hub_card/presentation/login/login_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    LoginState state = viewModel.state;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: switch (state.isLogin) {
              false => GestureDetector(
                  child: Container(
                    child: Text('Github Login'),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue, // 버튼의 배경색
                      borderRadius: BorderRadius.circular(20), // 둥근 모서리 반경
                      border: Border.all(
                        color: Colors.black, // 테두리 색상
                        width: 2, // 테두리 두께
                      ),
                    ),
                  ),
                  onTap: () async {
                    await viewModel.login();
                    // final currentUser = await viewModel.fetchUser();
                    if (!context.mounted) return;
                    await context.push('/card');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => CardScreen(
                    //       currentUser: currentUser,
                    //     ),
                    //   ),
                    // );
                  },
                ),
              true => GestureDetector(
                  child: Container(
                    child: Text('Github Logout'),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue, // 버튼의 배경색
                      borderRadius: BorderRadius.circular(20), // 둥근 모서리 반경
                      border: Border.all(
                        color: Colors.black, // 테두리 색상
                        width: 2, // 테두리 두께
                      ),
                    ),
                  ),
                  onTap: () {
                    viewModel.logout();
                  },
                ),
            },
          ), // const LanguageStampWidget()
        ],
      ),
    );
  }
}
