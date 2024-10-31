
import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/startScreen.dart';

/*
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
*/

class SetupSkipButton extends StatelessWidget {
  const SetupSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02), // 하단 여백 추가
      child: FractionallySizedBox(
        widthFactor: 0.85, // 버튼 너비를 화면 너비의 85%로 설정
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StartScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF979797), // 비활성화 시 회색 배경
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11), // 위쪽 여백
              Text(
                '다음에 설정하기',
                style: TextStyle(
                  fontSize: 18, // 텍스트 크기 조정
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 11), // 아래쪽 여백
            ],
          ),
        ),
      ),
    );
  }
}


