import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';

class Utils {
  final List<IconData> icons = [
    ModernPictograms.doc,
    ModernPictograms.globe,
    ModernPictograms.mail,
    ModernPictograms.edit,
    ModernPictograms.twitter_bird,
  ];

  void showDialog(BuildContext context, int turns) {
    showCupertinoModalPopup<void>(
      context: context,
      barrierColor: Colors.black26,
      builder: (BuildContext context) => RotatedBox(
        quarterTurns: turns,
        child: CupertinoAlertDialog(
          // title: const Text('Alert'),
          insetAnimationCurve: Curves.decelerate,
          content: const Text('Coming in the Future'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
// void showDialog(BuildContext context) {
//   showCupertinoDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Center(
//         child: Container(
//           width: 200,
//           height: 200,
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Custom Dialog',
//                 style: TextStyle(fontSize: 12),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // 다이얼로그 닫기
//                 },
//                 child: Text('Close'),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
}
