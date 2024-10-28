import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notiskku_demo/screens/home/mainhome.dart'; // 분리된 다섯 번째 페이지


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 270),
            // 이미지
            Image.asset(
              'assets/images/fourth.png',
              height: 250, // 이미지 크기 설정
              width: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 25),
            // 텍스트
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '이제 준비가 완료되었습니다!',
                  style: GoogleFonts.lato( // Lato 폰트 적용
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff0b5b42), // 텍스트 색상
                  ),
                ),
                const SizedBox(width: 8), // 이모티콘과 간격 조절
                const Text(
                  '🎉',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            // Spacer를 사용하여 버튼을 더 아래로 내리기
            const Spacer(), 
            // 버튼
            Padding(
              padding: const EdgeInsets.only(bottom: 60), // 아래 여백 추가
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0b5b42), // 버튼 색상
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  '나의 공지 보러가기',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white, // 버튼 텍스트 색상
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
