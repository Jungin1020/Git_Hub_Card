import 'package:flutter/material.dart';
import 'package:git_hub_card/domain/model/current_user.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.currentUser}) : super(key: key);
  final CurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 308,
      height: 554,
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
        child: RotatedBox(
          quarterTurns: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        currentUser.name,
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontFamily: 'NotoSans',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        currentUser.displayName,
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.avatarUrl),
                    radius: 40,
                  )
                ],
              ),
              const Spacer(),
              Row(children: [
                Icon(Icons.location_on_outlined,
                    color: Colors.grey.withOpacity(0.5)),
                Text(currentUser.location,
                    style: TextStyle(color: Colors.grey.withOpacity(0.5)))
              ]),
              Row(children: [
                Icon(Icons.add, color: Colors.grey.withOpacity(0.5)),
                Text('text1',
                    style: TextStyle(color: Colors.grey.withOpacity(0.5)))
              ]),
              Row(children: [
                Icon(Icons.add, color: Colors.grey.withOpacity(0.5)),
                Text('text1',
                    style: TextStyle(color: Colors.grey.withOpacity(0.5)))
              ]),
              Row(children: [
                Icon(Icons.add, color: Colors.grey.withOpacity(0.5)),
                Text('text1',
                    style: TextStyle(color: Colors.grey.withOpacity(0.5)))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
