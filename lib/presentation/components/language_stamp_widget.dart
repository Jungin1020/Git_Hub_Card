import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class LanguageStampWidget extends StatelessWidget {
  const LanguageStampWidget(
      {Key? key,
      required this.scale,
      required this.stampColor,
      required this.stampImagePath})
      : super(key: key);

  final double scale;
  final Color stampColor;
  final String stampImagePath;

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
              'assets/images/stamp_outline_1.png',
            ),
          ),
          Image.asset(
            stampImagePath,
            scale: scale,
          ),
          // WidgetMask(
          //   blendMode: BlendMode.modulate,
          //   childSaveLayer: true,
          //   mask: const CircleAvatar(
          //     radius: 150,
          //     backgroundColor: Colors.lightBlueAccent,
          //   ),
          //   child: Container(
          //       width: 150,
          //       child: Image.asset('assets/images/flutter_logo_120.png')),
          // ),
        ],
      ),
    );
  }
}
