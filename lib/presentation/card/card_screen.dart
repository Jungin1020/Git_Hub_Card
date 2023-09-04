import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/presentation/card/card_view_model.dart';
import 'package:git_hub_card/presentation/card/component/language_stamp_widget.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_mask/widget_mask.dart';
import '../../domain/use_case/sort_languages_use_case.dart';
import 'component/bottom_menu_widget.dart';
import 'component/card_widget.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    Future.delayed(
      Duration.zero,
      () {
        if (user == null) {
          context.replace('/login');
        }
      },
    );

    final viewModel = context.watch<CardViewModel>();
    final state = viewModel.state;
    // currentUser 없으면 리턴
    if (state.currentUser == null || state.logos == null) {
      return const Scaffold(
        backgroundColor: Color(0xff0D1116),
      );
    }

    final languages =
        sortLanguagesUseCase(state.currentUserRepo!, state.logos!);
    // print(languages);
    // final languages = ['git', 'dart', 'git'];

    final height = MediaQuery.of(context).size.height;
    final bottomBarHeight = height / 4;

    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            RotatedBox(
                quarterTurns: 1,
                child: Image.asset('assets/images/shadow.png')),
            RotatedBox(
                quarterTurns: 1,
                child: Image.asset('assets/images/shadow.png')),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  WidgetMask(
                    blendMode: BlendMode.colorBurn,
                    childSaveLayer: true,
                    mask: Image.asset('assets/images/card_color_burn.png'),
                    child: Container(
                      // color: const Color(0xff0D1116).withOpacity(0.91),
                      color: const Color(0xff0D1116).withOpacity(0.89),
                      width: 308,
                      height: 554,
                    ),
                  ),
                  CardWidget(currentUser: state.currentUser!),
                  Positioned(
                    right: 50,
                    bottom: 135,
                    child: Transform.rotate(
                      // 90 = 1
                      angle: 45,
                      child: SizedBox(
                        width: 140,
                        child: Opacity(
                          opacity: 0.7,
                          child: state.logos == null
                              ? null
                              : LanguageStampWidget(
                                  width: 48,
                                  language: languages[0],
                                  stampOutlinePath:
                                      'assets/images/stamp_outline_1.png',
                                  circularRadius: 30,
                                  circularFontSize: 12,
                                ),
                        ),
                      ),
                    ),
                  ), // stamp1
                  Positioned(
                    right: 175,
                    bottom: 60,
                    child: Transform.rotate(
                      // 90 = 1
                      angle: 2,
                      child: SizedBox(
                        width: 100,
                        child: Opacity(
                          opacity: 0.6,
                          child: state.logos == null
                              ? null
                              : LanguageStampWidget(
                                  width: 30,
                                  language: languages[1],
                                  stampOutlinePath:
                                      'assets/images/stamp_outline_2.png',
                                  circularRadius: 20,
                                  circularFontSize: 9,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 118,
                    bottom: -35,
                    child: Transform.rotate(
                      // 90 = 1
                      angle: 1.55,
                      child: SizedBox(
                        width: 120,
                        child: Opacity(
                          opacity: 0.6,
                          child: state.logos == null
                              ? null
                              : LanguageStampWidget(
                                  width: 36,
                                  language: languages[2],
                                  stampOutlinePath:
                                      'assets/images/stamp_outline_3.png',
                                  circularRadius: 26,
                                  circularFontSize: 10,
                                ),
                        ),
                      ),
                    ),
                  ),
                  // Center(
                  //   child: ListView.builder(
                  //       itemCount: languages.length,
                  //       itemBuilder: (context, index) {
                  //         return ListTile(
                  //           title: Text(languages[index]),
                  //         );
                  //       }),
                  // ),
                ],
              ),
            ),
            Positioned(
              right: 30,
              // bottom: 50,
              bottom: MediaQuery.of(context).size.height * 0.03,
              child: RotatedBox(
                quarterTurns: 1,
                child: Builder(
                    builder: (BuildContext context) => GestureDetector(
                          child: const Icon(
                            // Icons.code,
                            Icons.bookmark_sharp,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            viewModel.showBottomMenuBar();
                          },
                        )),
              ),
            ),
            Positioned(
              left: 35,
              // bottom: 50,
              bottom: MediaQuery.of(context).size.height * 0.03,
              child: RotatedBox(
                quarterTurns: 1,
                child: Builder(
                    builder: (BuildContext context) => GestureDetector(
                          child: const Icon(
                            // Icons.code,
                            Icons.center_focus_weak_sharp,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            viewModel.showBottomMenuBar();
                          },
                        )),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
              child: switch (state.isBottomMenu) {
                true => BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaY: 3.0, sigmaX: 3.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                false => const SizedBox()
              },
            ),
            AnimatedPositioned(
              bottom: switch (state.isBottomMenu) {
                true => 0,
                false => -(bottomBarHeight)
              },
              // left: 0,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 400),
              child: BottomMenuWidget(bottomBarHeight: bottomBarHeight),
            ),
            GestureDetector(
              child: Column(
                children: [
                  Container(
                    color: Colors.white.withOpacity(0.0),
                    width: double.infinity,
                    height: height - (bottomBarHeight),
                  )
                ],
              ),
              onTap: () {
                if (state.isBottomMenu) {
                  viewModel.unShowBottomMenuBar();
                }
              },
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xff0D1116),
    );
  }
}
