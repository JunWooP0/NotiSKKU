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
          '다음으로',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
