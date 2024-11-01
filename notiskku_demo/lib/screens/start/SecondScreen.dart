import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/ThirdScreen.dart';
import 'package:notiskku_demo/widgets/next_button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
            const SizedBox(height: 20), // Optional space for top padding
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // Vertical alignment of image and text
                    children: [
                      Text(
                        '공지사항도 내 스타일로!',
                        style: TextStyle(
                          fontSize: screenWidth * 0.065, // Responsive font size
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 10), // Space between text and image
                      Image.asset(
                        'assets/images/magic_wand.png',
                        height: screenWidth * 0.075, // Responsive image size
                        width: screenWidth * 0.075,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5), // Small spacing
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '원하는 소식만 확인할 수 있어요.',
                            style: TextStyle(
                              fontSize: screenWidth * 0.055, // Responsive font size
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
                  'assets/images/second.png',
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
                    _buildIndicatorCircle(color: const Color(0xff0b5b42)),
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
                    MaterialPageRoute(
                      builder: (context) => const ThirdScreen(),
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
