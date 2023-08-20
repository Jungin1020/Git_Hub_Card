import 'package:flutter/material.dart';
import 'package:git_hub_card/presentation/login_state.dart';
import 'package:git_hub_card/presentation/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    LoginState state = viewModel.state;

    return Scaffold(
      body: Center(
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
              onTap: () {
                viewModel.login();
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
      ),
    );
  }
}
