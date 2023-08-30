import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_mask/widget_mask.dart';

class LanguageStampWidget extends StatelessWidget {
  const LanguageStampWidget({
    Key? key,
    required this.width,
    required this.stampColor,
    required this.language,
    required this.iconSource,
  }) : super(key: key);

  final double width;
  final Color stampColor;
  final String language;
  final Future<String> Function(String language) iconSource;

  @override
  Widget build(BuildContext context) {
    final iconUrl =
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/$language/$language-plain.svg";

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
          // Image.asset(
          //   'assets/images/${language}_logo_120.png',
          //   scale: scale,
          // ),
          SvgPicture.network(
            iconUrl,
            width: width,
            // height: 50,
          ),
          // FutureBuilder<String>(
          //   future: iconSource(language),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(
          //         snapshot.data.toString(),
          //         style: TextStyle(fontSize: 20),
          //       );
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
