import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_hub_card/domain/use_case/word_symbol_switch_use_case.dart';
import 'package:widget_mask/widget_mask.dart';

class LanguageStampWidget extends StatelessWidget {
  const LanguageStampWidget({
    Key? key,
    required this.width,
    required this.language,
    required this.stampOutlinePath,
    required this.circularRadius,
    required this.circularFontSize,
  }) : super(key: key);

  final double width;
  final String language;
  final String stampOutlinePath;
  final double circularRadius;
  final double circularFontSize;

  @override
  Widget build(BuildContext context) {
    final iconUrl =
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/$language/$language-plain.svg";
    final displayLanguage = WordSymbolSwitchUseCase().wordToSymbol(language);
    // final colorString = logo.color.replaceAll('#', '');
    // final logoColor = Color(int.parse('FF$colorString', radix: 16));
    const stampColor = Colors.grey;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            mask: const CircleAvatar(
              // radius: 100,
              backgroundColor: stampColor,
            ),
            child: Image.asset(
              stampOutlinePath,
            ),
          ),
          CircularText(
            children: [
              TextItem(
                text: Text(
                  displayLanguage.toUpperCase(),
                  style: TextStyle(
                    fontSize: circularFontSize,
                    color: stampColor,
                    // color: Colors.white30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                space: 20,
                startAngle: 0,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
              TextItem(
                text: Text(
                  displayLanguage.toUpperCase(),
                  style: TextStyle(
                    fontSize: circularFontSize,
                    color: stampColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                space: 20,
                startAngle: 180,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
            ],
            radius: circularRadius,
            position: CircularTextPosition.outside,
            // backgroundPaint: Paint()..color = Colors.grey.shade200,
          ),
          CircularText(
            children: [
              TextItem(
                text: Text(
                  '+',
                  style: TextStyle(
                    fontSize: circularFontSize,
                    color: stampColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                space: 20,
                startAngle: 90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
              TextItem(
                text: Text(
                  '+',
                  style: TextStyle(
                    fontSize: circularFontSize,
                    color: stampColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                space: 20,
                startAngle: 270,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.clockwise,
              ),
            ],
            radius: circularRadius,
            position: CircularTextPosition.outside,
          ),
          WidgetMask(
            blendMode: BlendMode.plus,
            childSaveLayer: true,
            mask: SvgPicture.network(
              iconUrl,
              width: width,
              color: stampColor,
            ),
            child: SvgPicture.network(
              iconUrl,
              width: width,
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}
