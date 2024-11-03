import 'package:flutter/material.dart';
import 'package:notiskku_demo/widgets/next_button.dart';
import 'package:notiskku_demo/widgets/text_intro.dart';
import 'package:notiskku_demo/widgets/text_second.dart';
import 'package:notiskku_demo/widgets/text_third.dart';

import 'package:notiskku_demo/widgets/setup_skip_button.dart';
import 'package:notiskku_demo/widgets/setup_major_button.dart';

class ReIntroductionScreen extends StatefulWidget {
  const ReIntroductionScreen({super.key});

  @override
  _ReIntroductionScreenState createState() => _ReIntroductionScreenState();
}

class _ReIntroductionScreenState extends State<ReIntroductionScreen> {
  int pageCount = 1;

  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    void _nextPage() {
      setState(() {
        if (pageCount < 3) {
          pageCount += 1;
        }
      });
    }

    Widget _buildTextWidget() {
      switch (pageCount) {
        case 1:
          return TextIntro(screenWidth: screenWidth);
        case 2:
          return TextSecond(screenWidth: screenWidth);
        case 3:
          return TextThird(screenWidth: screenWidth);
        default:
          return const SizedBox.shrink(); // 잘못된 값에 대한 기본값
      }
    }

    Widget _buildImageWidget() {
      switch (pageCount) {
        case 1:
          return Image.asset(
            'assets/images/first_fix.png',
            height: screenHeight * 0.35, // Responsive image height
            width: screenWidth * 0.6, // Responsive image width
            fit: BoxFit.contain,
          );
        case 2:
          return Image.asset(
            'assets/images/second_fix.png',
            height: screenHeight * 0.35, // Responsive image height
            width: screenWidth * 0.6, // Responsive image width
            fit: BoxFit.contain,
          );
        case 3:
          return Image.asset(
            'assets/images/third_fix.png',
            height: screenHeight * 0.35, // Responsive image height
            width: screenWidth * 0.6, // Responsive image width
            fit: BoxFit.contain,
          );
        default:
          return const SizedBox.shrink(); // 잘못된 값에 대한 기본값
      }
    }

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

    Widget _buildIndicatorRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5), // 간격을 위한 패딩
            child: _buildIndicatorCircle(
              color: pageCount == index + 1
                  ? const Color(0xff0b5b42)
                  : Colors.grey,
            ),
          );
        }),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 90), // 텍스트와 이미지 사이의 공간을 유지
            Expanded(
              child: Stack(
                alignment: Alignment.center, // 텍스트를 왼쪽 상단에 정렬
                children: [
                  // 이미지 위젯 고정 위치
                  Positioned(
                    top: 100, // 고정된 위치
                    child: _buildImageWidget(),
                  ),
                  // 텍스트 위젯은 Stack의 상단에 위치
                  Positioned(
                    top: 0,
                    left: 10, // 왼쪽 정렬을 위한 위치 설정
                    child: _buildTextWidget(),
                  ),
                  Positioned(
                    top: 410,
                    child: _buildIndicatorRow(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              child: pageCount == 3
                  ? const Column(
                      children: [
                        SetupSkipButton(), // SetupSkipButton 위젯
                        SizedBox(height: 3), // 두 버튼 사이의 간격
                        SetMajorButton(), // SetMajorButton 위젯
                      ],
                    )
                  : NextButton(
                      onPressed: _nextPage), // pageCount가 1 또는 2일 때 NextButton
            ),
          ],
        ),
      ),
    );
  }
}
