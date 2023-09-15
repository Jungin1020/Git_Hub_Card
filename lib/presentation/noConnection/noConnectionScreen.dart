import 'package:flutter/material.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              const CircleAvatar(
                radius: 64,
                backgroundColor: Color(0xffEA4AAA),
                child: Icon(
                  Icons.wifi_off_sharp,
                  color: Colors.white,
                  size: 48,
                ),
              ),

              const SizedBox(height: 84),
              const Text(
                'You are not connected to the internet',
                style: TextStyle(
                    color: Color(0xff04CFC8),
                    fontSize: 14,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              // SizedBox(height: 2),
              const Text(
                'Please check your connection',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              // const SizedBox(height: 8),
              // IconButton(
              //     onPressed: () {
              //       refresh();
              //     },
              //     icon: const Icon(Icons.refresh_sharp))
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff040D21),
    );
  }
}
