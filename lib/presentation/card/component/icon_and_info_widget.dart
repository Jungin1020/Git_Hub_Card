import 'package:flutter/material.dart';

class IconAndInfoWidget extends StatelessWidget {
  const IconAndInfoWidget({
    super.key,
    required this.icon,
    required this.info,
  });

  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                // SizedBox(height: 1),
                Icon(icon, color: Colors.grey.withOpacity(0.5), size: 15),
              ],
            ),
            const SizedBox(width: 7),
            SizedBox(
              width: 210,
              child: Text(
                info,
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontFamily: 'NotoSans',
                    fontSize: 13,
                    height: 1.2,
                    letterSpacing: 0.3),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
