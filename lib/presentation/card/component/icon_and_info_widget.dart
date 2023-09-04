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
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.grey.withOpacity(0.5), size: 18),
            const SizedBox(width: 6),
            SizedBox(
              width: 200,
              child: Text(
                info,
                style: TextStyle(color: Colors.grey.withOpacity(0.5)),
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
