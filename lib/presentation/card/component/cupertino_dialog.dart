import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDialog {
  void showDialog(BuildContext context, int turns) {
    showCupertinoModalPopup<void>(
      context: context,
      barrierColor: Colors.black26,
      builder: (BuildContext context) => RotatedBox(
        quarterTurns: turns,
        child: CupertinoAlertDialog(
          insetAnimationCurve: Curves.decelerate,
          content: const Text('Coming in the Future'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: false,
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
}
