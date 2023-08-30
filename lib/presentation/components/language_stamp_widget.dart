import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_hub_card/domain/model/logo.dart';
import 'package:widget_mask/widget_mask.dart';

class LanguageStampWidget extends StatelessWidget {
  const LanguageStampWidget({
    Key? key,
    required this.width,
    required this.stampColor,
    required this.language,
    required this.logo,
  }) : super(key: key);

  final double width;
  final Color stampColor;
  final String language;
  final Logo logo;

  @override
  Widget build(BuildContext context) {
    final iconUrl =
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/$language/$language-plain.svg";
    final colorString = logo.color.replaceAll('#', '');
    final color = Color(int.parse('FF$colorString', radix: 16));

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            mask: CircleAvatar(
              // radius: 100,
              backgroundColor: color,
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
