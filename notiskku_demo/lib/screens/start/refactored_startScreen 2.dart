import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notiskku_demo/screens/home/mainhome.dart'; // 분리된 다섯 번째 페이지
import 'package:notiskku_demo/widgets/my_notice_button.dart'; // Import the MyNoticeButton widget

class ReStartScreen extends StatelessWidget {
  const ReStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.25,
                ), // Adjusted height based on screen height
                // Image
                Image.asset(
                  'assets/images/fourth_fix.png',
                  height: screenHeight * 0.3, // Image size based on screen height
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
                      style: GoogleFonts.lato(
                        fontSize: screenWidth * 0.06, // Font size based on screen width
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0b5b42), // Text color
                      ),
                    ),
                    Text(
                      '🎉',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07, // Emoji size based on screen width
                      ),
                    ),
                  ],
                ),
                const Spacer(), // Column 내에서 여유 공간을 차지하여 아래로 밀어줌
              ],
            ),
            // 버튼을 Stack의 하단에 고정
            Positioned(
              bottom: 0, // 버튼의 하단 여백
              left: 0,
              right: 0, // 버튼이 중앙에 위치하도록 설정
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
