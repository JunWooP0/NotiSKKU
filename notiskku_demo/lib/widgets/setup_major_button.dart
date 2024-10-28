import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/select_major.dart';

class SetMajorButton extends StatelessWidget {
  const SetMajorButton({super.key});

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
                builder: (context) => const SelectMajorScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff0b5b42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11), // 위쪽 여백
              Text(
                '학과/키워드 설정하기',
                style: TextStyle(fontSize: 18, color: Colors.white), // 텍스트 크기 변경
              ),
              SizedBox(height: 11), // 아래쪽 여백
            ],
          ),
        ),
      ),
    );
  }
}
