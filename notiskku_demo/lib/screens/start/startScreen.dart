import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notiskku_demo/screens/home/mainhome.dart'; // 분리된 다섯 번째 페이지

import 'package:notiskku_demo/widgets/my_notice_button.dart'; // Import the MyNoticeButton widget

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: screenHeight * 0.25), // Adjusted height based on screen height
            // Image
            Image.asset(
              'assets/images/fourth.png',
              height: screenHeight * 0.25, // Image size based on screen height
              width: screenWidth * 0.5, // Image width based on screen width
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * 0.03), // Space based on screen height
            // Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '이제 준비가 완료되었습니다!',
                  style: GoogleFonts.lato( // Lato font applied
                    fontSize: screenWidth * 0.065, // Font size based on screen width
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff0b5b42), // Text color
                  ),
                ),
                const SizedBox(width: 8), // Space between text and emoji
                Text(
                  '🎉',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // Emoji size based on screen width
                  ),
                ),
              ],
            ),
            // Spacer to push the button down
            const Spacer(),
            // Button
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.05), // Bottom padding based on screen height
              child: MyNoticeButton(
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
