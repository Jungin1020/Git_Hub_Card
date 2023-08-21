import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 308,
      height: 554,
      // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 40),
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
                      SizedBox(height: 12),
                      Text(
                        'JUNG IN CHOI',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        'Jungin1020',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 40,
                  )
                ],
              ),
              Spacer(),
              Row(children: [
                Icon(Icons.add, color: Colors.grey),
                Text('text1', style: TextStyle(color: Colors.white))
              ]),
              Row(children: [
                Icon(Icons.add, color: Colors.grey),
                Text('text1', style: TextStyle(color: Colors.white))
              ]),
              Row(children: [
                Icon(Icons.add, color: Colors.grey),
                Text('text1', style: TextStyle(color: Colors.white))
              ]),
              Row(children: [
                Icon(Icons.add, color: Colors.grey),
                Text('text1', style: TextStyle(color: Colors.white))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
