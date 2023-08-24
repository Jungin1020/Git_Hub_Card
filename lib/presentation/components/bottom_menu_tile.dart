import 'package:flutter/material.dart';

class BottomMenuTile extends StatelessWidget {
  const BottomMenuTile({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      // color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RotatedBox(
          quarterTurns: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 18,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(width: 5),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
