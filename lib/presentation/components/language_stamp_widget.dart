import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class LanguageStampWidget extends StatelessWidget {
  const LanguageStampWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            mask: const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.lightBlueAccent,
            ),
            child: Image.asset(
              'assets/images/stamp_outline.png',
            ),
          ),
          Container(
            child: Image.asset(
              'assets/images/flutter_logo_120.png',
              scale: 1.4,
            ),
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
