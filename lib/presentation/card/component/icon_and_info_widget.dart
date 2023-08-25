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
        SizedBox(height: 4),
        Row(
          children: [
            Icon(icon, color: Colors.grey.withOpacity(0.5), size: 18),
            SizedBox(width: 6),
            Text(info, style: TextStyle(color: Colors.grey.withOpacity(0.5)))
          ],
        ),
      ],
    );
  }
}
