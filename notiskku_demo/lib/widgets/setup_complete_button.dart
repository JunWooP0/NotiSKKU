//수정 필요

/* 기존 코드
import 'package:flutter/material.dart';

class NextButton extends StatefulWidget {
  const NextButton({
    super.key,
    required this.selectedMajor,
    required this.selectedKeyword,
  });

  final List<String> selectedMajor;
  final List<String> selectedKeyword;

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: widget.selectedMajor.isNotEmpty // 선택된 전공이 있을 때만 동작
            ? () {
                // 버튼 클릭 시 행동 추가 (예: 다음 페이지로 이동)
              }
            : null, // 선택된 전공이 없을 경우 null로 설정
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.selectedMajor.isNotEmpty // 최소 1개의 전공이 선택되었을 때
              ? const Color(0xFF0B5B42)
              : const Color(0xFF979797),
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          '다음으로', //figma에서 '설정완료'
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

class SetupCompleteButton extends StatefulWidget {
  const SetupCompleteButton({
    super.key,
    required this.selectedMajor,
    required this.selectedKeyword,
  });

  final List<String> selectedMajor;
  final List<String> selectedKeyword;

  @override
  State<SetupCompleteButton> createState() => _SetupCompleteButtonState();
}

class _SetupCompleteButtonState extends State<SetupCompleteButton> {
  @override
  Widget build(BuildContext context) {
    // 화면 너비와 높이를 가져옵니다.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02), // 화면 높이의 2%를 아래쪽 여백으로 설정
      child: ElevatedButton(
        onPressed: widget.selectedMajor.isNotEmpty
            ? () {
                // 버튼 클릭 시 행동 추가 (예: 다음 페이지로 이동)
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.selectedMajor.isNotEmpty
              ? const Color(0xFF0B5B42)
              : const Color(0xFF979797),
          // padding: EdgeInsets.symmetric(
          //   horizontal: screenWidth * 0.25, // 화면 너비의 25%로 수평 패딩 설정
          //   vertical: screenHeight * 0.015, // 버튼 높이를 줄이기 위해 화면 높이의 1.5%로 수직 패딩 설정
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          '설정완료',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/startScreen.dart';

class SetupCompleteButton extends StatefulWidget {
  const SetupCompleteButton({
    super.key,
    required this.selectedMajor,
    required this.selectedKeyword,
  });

  final List<String> selectedMajor;
  final List<String> selectedKeyword;

  @override
  State<SetupCompleteButton> createState() => _SetupCompleteButtonState();
}

class _SetupCompleteButtonState extends State<SetupCompleteButton> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: ElevatedButton(
          onPressed: widget.selectedMajor.isNotEmpty
              ? () {
                  // 버튼 클릭 시 startScreen으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StartScreen()),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.selectedMajor.isNotEmpty
                ? const Color(0xFF0B5B42)
                : const Color(0xFF979797),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11),
              Text(
                '설정완료',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 11),
            ],
          ),
        ),
      ),
    );
  }
}