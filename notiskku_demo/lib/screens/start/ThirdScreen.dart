import 'package:flutter/material.dart';
import 'package:notiskku_demo/widgets/setup_skip_button.dart';
import 'package:notiskku_demo/widgets/setup_major_button.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: screenHeight * 0.1), // 10% of screen height
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '중요한 소식, 내가 먼저!',
                        style: TextStyle(
                          fontSize: screenWidth * 0.065, // Responsive font size
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/medal.png',
                        height: screenWidth * 0.075, // Responsive image size
                        width: screenWidth * 0.075,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '띠링~ 필요한 알림만 받을 수 있어요.',
                            style: TextStyle(
                              fontSize: screenWidth * 0.05, // Responsive font size
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/third.png',
                  height: screenHeight * 0.35, // Responsive image height
                  width: screenHeight * 0.35, // Responsive image width
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIndicatorCircle(color: Colors.grey),
                    const SizedBox(width: 15),
                    _buildIndicatorCircle(color: Colors.grey),
                    const SizedBox(width: 15),
                    _buildIndicatorCircle(color: const Color(0xff0b5b42)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.07), // Responsive bottom padding
              child: const Column(
                children: [
                  SetupSkipButton(),
                  SizedBox(height: 3),
                  SetMajorButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build indicator circles
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
