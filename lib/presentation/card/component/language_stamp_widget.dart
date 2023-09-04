import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_hub_card/domain/use_case/language_filter_use_case.dart';
import 'package:git_hub_card/domain/use_case/word_symbol_switch_use_case.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:http/http.dart' as http;

class LanguageStampWidget extends StatelessWidget {
  const LanguageStampWidget({
    Key? key,
    required this.width,
    required this.language,
    required this.version,
    required this.stampOutlinePath,
    required this.circularRadius,
    required this.circularFontSize,
  }) : super(key: key);

  final double width;
  final String language;
  final String version;
  final String stampOutlinePath;
  final double circularRadius;
  final double circularFontSize;

  @override
  Widget build(BuildContext context) {
    final iconUrl =
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/$language/$language-$version.svg";

    String displayLanguage = WordSymbolSwitchUseCase().wordToSymbol(language);
    displayLanguage = LanguageFilterUseCase().filterLanguage(displayLanguage);
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
                space: 18,
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
                space: 18,
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
                space: 18,
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
          //
          // FutureBuilder(
          //   future: loadSvg(iconUrl),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       if (snapshot.hasError) {
          //         // 아이콘 로딩 실패 시 대체 아이콘 사용
          //         return SvgPicture.network(
          //           iconUrl.replaceAll('-plain', '-original'),
          //           width: width, // 너비 조절
          //           color: stampColor, // 아이콘 색상
          //         );
          //       } else {
          //         // 아이콘 로딩 성공 시 아이콘 표시
          //         return SvgPicture.network(
          //           iconUrl,
          //           width: width, // 너비 조절
          //           color: stampColor, // 아이콘 색상
          //         );
          //       }
          //     } else {
          //       // 로딩 중인 경우 프로그래스 바 표시
          //       return CircularProgressIndicator();
          //     }
          //   },
          // ),
          //
          SvgPicture.network(
            iconUrl,
            width: width,
            color: stampColor,
          )
        ],
      ),
    );
  }

  Future<Widget> loadSvg(String url) async {
    final svgString = await http.get(Uri.parse(url)); // 원격 SVG 파일을 가져옴
    return SvgPicture.string(
      svgString.body,
      width: 100, // 너비 조절
      color: Colors.blue, // 아이콘 색상
    );
  }
}
