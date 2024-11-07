import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/IntroductionScreen.dart';
import 'package:notiskku_demo/screens/start/refactored_introScreen.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    // 일정 시간 후에 IntroductionScreen으로 이동
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (context) => const IntroductionScreen()),
        MaterialPageRoute(builder: (context) => const ReIntroductionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: const Color(0xff0b5b42),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              //'assets/images/logo.png',
              'assets/images/whitelogo_fix.png',
              width: screenWidth * 0.8, // Set width as 80% of screen width
              height: screenHeight * 0.25, // Set height as 25% of screen height
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10), // 간격 추가

            Text(
              'NotiSKKU',
              style: TextStyle(
                fontSize: screenWidth * 0.15, // Font size as 15% of screen width
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
