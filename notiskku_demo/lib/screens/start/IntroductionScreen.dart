import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notiskku_demo/screens/start/SecondScreen.dart';
import 'package:notiskku_demo/widgets/next_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20), // Optional space for top padding
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
                    child: Text(
                      '성균관대 공지사항 어플',
                      style: TextStyle(
                        fontSize: screenWidth * 0.065, // Adjusting font size to be responsive
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5), // Adding space
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'NotiSKKU',
                            style: GoogleFonts.lato(
                              fontSize: screenWidth * 0.075, // Responsive font size
                              fontWeight: FontWeight.w900,
                              color: const Color(0xff0b5b42),
                            ),
                          ),
                          TextSpan(
                            text: '를 소개합니다!',
                            style: TextStyle(
                              fontSize: screenWidth * 0.065, // Responsive font size
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left, // Left alignment
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/first.png',
                  height: screenHeight * 0.35, // Responsive image height
                  width: screenWidth * 0.6, // Responsive image width
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                // Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIndicatorCircle(color: const Color(0xff0b5b42)),
                    const SizedBox(width: 15),
                    _buildIndicatorCircle(color: Colors.grey),
                    const SizedBox(width: 15),
                    _buildIndicatorCircle(color: Colors.grey),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.07), // Responsive bottom padding
              child: NextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the indicator circles
  Widget _buildIndicatorCircle({required Color color}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
