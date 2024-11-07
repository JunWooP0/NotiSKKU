import 'package:flutter/material.dart';

class MyNoticeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyNoticeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02), // Adjust padding based on screen height
      child: FractionallySizedBox(
        widthFactor: 0.85, // Use a fraction of the available width
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff0b5b42), // Button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11), // Space above the text
              Text(
                '나의 공지 보러가기',
                style: TextStyle(
                  fontSize: 18, // Text size
                  color: Colors.white, // Button text color
                ),
              ),
              SizedBox(height: 11), // Space below the text
            ],
          ),
        ),
      ),
    );
  }
}
