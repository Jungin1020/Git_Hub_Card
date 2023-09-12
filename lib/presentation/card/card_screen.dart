import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/presentation/card/component/cupertino_dialog.dart';
import 'package:git_hub_card/presentation/card/card_view_model.dart';
import 'package:provider/provider.dart';
import 'component/bottom_menu_widget.dart';
import 'component/card_widget.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  bool isCardTapped = false;

  @override
  Widget build(BuildContext context) {
    final cupertinoDialog = CupertinoDialog();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final viewModel = context.watch<CardViewModel>();
    final state = viewModel.state;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const double cardHeight = 554;
    const double cardWidth = 308;

    // currentUser 없으면 리턴
    if (state.currentUser == null || state.logos == null) {
      return const Scaffold(
        backgroundColor: Color(0xff0D1116),
      );
    }

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
            // AnimatedOpacity(
            //     opacity: opacity,
            //     duration: const Duration(seconds: 10),
            //     curve: Curves.decelerate,
            //     child: CardWidget(state: state)),
            CardWidget(state: state),
            AnimatedPositioned(
              right: 30,
              bottom: isCardTapped ? -30 : (height - cardHeight) / 5,
              duration: const Duration(milliseconds: 250),
              curve: Curves.fastOutSlowIn,
              child: RotatedBox(
                quarterTurns: 1,
                child: Builder(
                  builder: (BuildContext context) => GestureDetector(
                    child: const Icon(
                      Icons.bookmark_sharp,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      viewModel.showBottomMenuBar();
                    },
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              left: 35,
              bottom: isCardTapped ? -30 : (height - cardHeight) / 5,
              duration: const Duration(milliseconds: 250),
              curve: Curves.fastOutSlowIn,
              child: RotatedBox(
                quarterTurns: 1,
                child: Builder(
                  builder: (BuildContext context) => GestureDetector(
                    child: const Icon(
                      Icons.center_focus_weak_sharp,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      cupertinoDialog.showDialog(context, 1);
                    },
                  ),
                ),
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
                false => -(height / 4)
              },
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 400),
              child: BottomMenuWidget(
                bottomBarHeight: height / 4,
                state: state,
                fetchLanguages: viewModel.fetchLanguages,
                unShowBottomMenuBar: viewModel.unShowBottomMenuBar,
              ),
            ),
            GestureDetector(
              child: Column(
                children: [
                  Container(
                    color: Colors.white.withOpacity(0.0),
                    width: double.infinity,
                    height: height - (height / 4),
                  )
                ],
              ),
              onTap: () {
                if (state.isBottomMenu) {
                  viewModel.unShowBottomMenuBar();
                }
              },
            ),
            (state.isBottomMenu == false)
                ? Positioned(
                    top: (height - cardHeight) / 2,
                    right: (width - cardWidth) / 2,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox(
                        width: cardWidth,
                        height: cardHeight,
                        child: Text(''),
                      ),
                      onTap: () {
                        setState(
                          () {
                            isCardTapped = !isCardTapped;
                          },
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      backgroundColor: const Color(0xff0D1116),
    );
  }
}
