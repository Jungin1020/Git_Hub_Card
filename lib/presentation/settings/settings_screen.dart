import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0D1116),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 8),
                CircleAvatar(radius: 6, backgroundColor: Color(0xffD04E4E)),
                SizedBox(width: 8),
                CircleAvatar(radius: 6, backgroundColor: Color(0xffE7B53C)),
                SizedBox(width: 8),
                CircleAvatar(radius: 6, backgroundColor: Color(0xff5FD04E)),
              ],
            ),
            // Divider(
            //   color: Colors.white,
            // ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                hintText: '~% Enter a command',
                hintStyle: TextStyle(color: Colors.grey.shade800),
                filled: true,
                fillColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // 밑줄 제거
                  borderRadius: BorderRadius.circular(12.0), // 모서리를 동그랗게 만듭니다.
                ),
              ),
            ),
            // Text(
            //   'githubcard@user ~ %',
            //   style: TextStyle(fontSize: 16),
            // ),
            SizedBox(height: 96)
          ],
        ),
      ),
      backgroundColor: const Color(0xff0D1116),
    );
  }
}
