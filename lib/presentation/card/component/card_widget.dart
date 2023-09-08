import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

import '../card_state.dart';
import 'language_stamp_widget.dart';
import 'name_and_avatar_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.state,
  });

  final CardState state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          WidgetMask(
            blendMode: BlendMode.colorBurn,
            childSaveLayer: true,
            mask: Image.asset('assets/images/card_color_burn.png'),
            child: Container(
              color: const Color(0xff0D1116).withOpacity(0.89),
              width: 308,
              height: 554,
            ),
          ),
          NameAndAvatarWidget(currentUser: state.currentUser!),
          Positioned(
            right: 50,
            bottom: 135,
            child: Transform.rotate(
              angle: 45,
              child: SizedBox(
                width: 140,
                child: Opacity(
                  opacity: 0.7,
                  child: state.logos == null
                      ? null
                      : LanguageStampWidget(
                          width: 36,
                          language: state.languages[0],
                          version: (state.logos!
                                  .firstWhere(
                                      (e) => e.name == state.languages[0])
                                  .versions
                                  .contains('plain'))
                              ? 'plain'
                              : 'original',
                          stampOutlinePath: 'assets/images/stamp_outline_1.png',
                          circularRadius: 30,
                          circularFontSize: 11,
                        ),
                ),
              ),
            ),
          ), // stamp1
          Positioned(
            right: 175,
            bottom: 60,
            child: Transform.rotate(
              angle: 2,
              child: SizedBox(
                width: 100,
                child: Opacity(
                  opacity: 0.6,
                  child: state.logos == null
                      ? null
                      : LanguageStampWidget(
                          width: 24,
                          language: state.languages[1],
                          version: (state.logos!
                                  .firstWhere(
                                      (e) => e.name == state.languages[1])
                                  .versions
                                  .contains('plain'))
                              ? 'plain'
                              : 'original',
                          stampOutlinePath: 'assets/images/stamp_outline_2.png',
                          circularRadius: 22,
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
              angle: 1.6,
              child: SizedBox(
                width: 120,
                child: Opacity(
                  opacity: 0.6,
                  child: state.logos == null
                      ? null
                      : LanguageStampWidget(
                          width: 28,
                          language: state.languages[2],
                          version: (state.logos!
                                  .firstWhere(
                                      (e) => e.name == state.languages[2])
                                  .versions
                                  .contains('plain'))
                              ? 'plain'
                              : 'original',
                          stampOutlinePath: 'assets/images/stamp_outline_3.png',
                          circularRadius: 26,
                          circularFontSize: 10,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
