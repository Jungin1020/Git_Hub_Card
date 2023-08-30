import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/presentation/card/card_view_model.dart';
import 'package:git_hub_card/presentation/components/language_stamp_widget.dart';
import 'package:provider/provider.dart';
import 'package:widget_mask/widget_mask.dart';

import '../components/bottom_menu_widget.dart';
import 'component/card_widget.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final viewModel = context.watch<CardViewModel>();
    final state = viewModel.state;
    // currentUser 없으면 리턴
    if (state.currentUser == null) {
      return const Scaffold(backgroundColor: Color(0xff0D1116));
    }

    // final languages = sortLanguagesUseCase(state.currentUserRepo!);
    final languages = ['git', 'dart', 'python'];

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
                      color: const Color(0xff0D1116).withOpacity(0.93),
                      width: 308,
                      height: 554,
                    ),
                  ),
                  CardWidget(currentUser: state.currentUser!),
                  Positioned(
                    right: 60,
                    bottom: 125,
                    child: Transform.rotate(
                      // 90 = 1
                      angle: 45,
                      child: SizedBox(
                        width: 135,
                        height: 135,
                        child: Opacity(
                          opacity: 0.7,
                          child: LanguageStampWidget(
                            width: 64,
                            stampColor: Colors.lightBlueAccent,
                            language: languages[0],
                            iconSource: viewModel.getIconSource,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 175,
                    bottom: 56,
                    child: Transform.rotate(
                      // 90 = 1
                      angle: 2,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Opacity(
                          opacity: 0.7,
                          child: LanguageStampWidget(
                            width: 40,
                            stampColor: const Color(0xff3671A1),
                            language: languages[1],
                            iconSource: viewModel.getIconSource,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 122,
                    bottom: -35,
                    child: Transform.rotate(
                      // 90 = 1
                      angle: 1.55,
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Opacity(
                          opacity: 0.7,
                          child: LanguageStampWidget(
                            width: 56,
                            stampColor: const Color(0xffF05033),
                            language: languages[2],
                            iconSource: viewModel.getIconSource,
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
              bottom: 50,
              child: RotatedBox(
                quarterTurns: 1,
                child: Builder(
                    builder: (BuildContext context) => GestureDetector(
                          child: const Icon(Icons.menu_open_outlined),
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
                    filter: ImageFilter.blur(sigmaY: 3.0, sigmaX: 3.0),
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
