//'선택하지 않음' 버튼
//이 버튼 누르면 키워드 설정 없어도
//'설정 완료' 버튼 활성화

import 'package:flutter/material.dart';

class DoNotSelect extends StatelessWidget {
  const DoNotSelect({
    super.key,
    required this.onPressed,
    required this.isSelected,
  });

  final void Function() onPressed; // Callback when button is pressed
  final bool isSelected; // Current state of the button

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width; // 화면 너비 가져오기
    final buttonWidth = (screenWidth - 80) / 3; // 버튼 너비 조정 (여백을 고려하여 3개로 나누기)


    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: ElevatedButton(
          onPressed: onPressed, // Call the provided callback
          style: ElevatedButton.styleFrom(
            elevation: 0, // 그림자 효과 제거
            shadowColor: Colors.transparent, // 그림자 색상 제거
            backgroundColor:
                isSelected ? const Color(0xB20B5B42) : const Color(0x99D9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 11),
              Text(
                '선택하지 않음',
                style: TextStyle(
                  fontSize: buttonWidth * 0.16, // 버튼 너비에 따라 텍스트 크기 조정
                  color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF979797),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 11),
            ],
          ),
        ),
      ),
    );
  }
}
