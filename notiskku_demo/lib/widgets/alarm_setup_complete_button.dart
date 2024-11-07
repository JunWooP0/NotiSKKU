import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/refactored_startScreen.dart';


class AlarmSetupCompleteButton extends StatefulWidget {
  const AlarmSetupCompleteButton({
    super.key,
  });


  @override
  State<AlarmSetupCompleteButton> createState() => _AlarmSetupCompleteButtonState();
}

class _AlarmSetupCompleteButtonState extends State<AlarmSetupCompleteButton> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: ElevatedButton(
          onPressed: ()
                {
                  // 버튼 클릭 시 startScreen으로 이동
                  Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (context) => const StartScreen()),
                    MaterialPageRoute(builder: (context) => const ReStartScreen()),
                  );
                },
          style: ElevatedButton.styleFrom(
            backgroundColor:const Color(0xFF0B5B42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11),
              Text(
                '알림설정완료',
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
