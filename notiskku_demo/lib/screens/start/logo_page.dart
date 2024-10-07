import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/IntroductionScreen.dart';

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
        MaterialPageRoute(builder: (context) => const IntroductionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b5b42),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                width: 400,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10), // 간격 추가
            const Text(
              'NotiSKKU',
              style: TextStyle(
                fontSize: 60,
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
