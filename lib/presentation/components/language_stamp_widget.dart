import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class LanguageStampWidget extends StatelessWidget {
  const LanguageStampWidget(
      {Key? key,
      required this.scale,
      required this.stampColor,
      required this.language})
      : super(key: key);

  final double scale;
  final Color stampColor;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            mask: CircleAvatar(
              // radius: 100,
              backgroundColor: stampColor,
            ),
            child: Image.asset(
              'assets/images/stamp_outline.png',
            ),
          ),
          Image.asset(
            'assets/images/${language}_logo_120.png',
            scale: scale,
          ),
        ],
      ),
    );
  }
}
