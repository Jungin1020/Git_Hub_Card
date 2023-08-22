import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_hub_card/presentation/card/card_view_model.dart';
import 'package:git_hub_card/presentation/components/language_stamp_widget.dart';
import 'package:provider/provider.dart';
import 'package:widget_mask/widget_mask.dart';

import '../components/card_widget.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final viewModel = context.watch<CardViewModel>();
    // viewModel.fetchUser();
    final state = viewModel.state;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          RotatedBox(
              quarterTurns: 1, child: Image.asset('assets/images/shadow.png')),
          RotatedBox(
              quarterTurns: 1, child: Image.asset('assets/images/shadow.png')),
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
                    child: const SizedBox(
                      width: 135,
                      height: 135,
                      child: Opacity(
                        opacity: 0.7,
                        child: LanguageStampWidget(
                          scale: 1.65,
                          stampColor: Colors.lightBlueAccent,
                          stampImagePath: 'assets/images/flutter_logo_120.png',
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
                    child: const SizedBox(
                      width: 100,
                      height: 100,
                      child: Opacity(
                        opacity: 0.7,
                        child: LanguageStampWidget(
                          scale: 2.2,
                          stampColor: Color(0xff3671A1),
                          stampImagePath: 'assets/images/python_logo_120.png',
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
                    child: const SizedBox(
                      width: 120,
                      height: 120,
                      child: Opacity(
                        opacity: 0.7,
                        child: LanguageStampWidget(
                          scale: 1.9,
                          stampColor: Color(0xffF05033),
                          stampImagePath: 'assets/images/git_logo_120.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff0D1116),
    );
  }
}
