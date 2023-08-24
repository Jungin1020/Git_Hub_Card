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
              child: Column(
                children: [
                  const Text(
                    'Welcome to Github Card!',
                    style: TextStyle(
                        color: Color(0xff04CFC8),
                        fontSize: 16,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 32),
                  switch (state.isLogin) {
                    false => GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // 둥근 모서리 반경
                              border: Border.all(
                                color: Colors.white, // 테두리 색상
                                width: 0.5, // 테두리 두께
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sign up to Github',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NotoSans',
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xffEA4AAA),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {
                          await viewModel.login();
                          if (!context.mounted) return;
                          await context.push('/card');
                        },
                      ),
                    true => GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.blue, // 버튼의 배경색
                            borderRadius:
                                BorderRadius.circular(20), // 둥근 모서리 반경
                            border: Border.all(
                              color: Colors.black, // 테두리 색상
                              width: 2, // 테두리 두께
                            ),
                          ),
                          child: const Text('Github Logout'),
                        ),
                        onTap: () {
                          viewModel.logout();
                        },
                      ),
                  },
                ],
              ),
            ), // const LanguageStampWidget()
          ],
        ),
        backgroundColor: const Color(0xff040D21));
  }
}
