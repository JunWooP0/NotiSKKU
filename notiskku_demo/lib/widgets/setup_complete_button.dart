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