import 'package:flutter/material.dart';
import 'bottom_menu_tile.dart';

class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({Key? key, required this.bottomBarHeight})
      : super(key: key);
  final double bottomBarHeight;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0xff0D1116).withOpacity(0.8),
      height: bottomBarHeight,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: BottomMenuTile(
                title: 'Cards',
                icon: Icon(
                  Icons.filter_none_sharp,
                  color: Colors.grey.withOpacity(0.3),
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 20),
            BottomMenuTile(
              title: 'Profile',
              icon: Icon(
                Icons.person_outlined,
                color: Colors.grey.withOpacity(0.3),
                size: 23,
              ),
            ),
            const SizedBox(width: 56),
          ],
        ),
      ),
    );
  }
}
