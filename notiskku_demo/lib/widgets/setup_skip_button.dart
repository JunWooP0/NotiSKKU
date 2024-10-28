import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/startScreen.dart';

class SetupSkipButton extends StatelessWidget {
  const SetupSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StartScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey, // Grey background color
        padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        '다음에 설정하기',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
