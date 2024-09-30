import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notiskku_demo/screens/start/SecondScreen.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20), // Optional space for top padding
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      '성균관대 공지사항 어플',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5), // 약간의 간격 추가
                // 'NotiSKKU를 소개합니다!' 부분의 스타일을 분리하여 적용
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'NotiSKKU',
                            style: GoogleFonts.lato(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xff0b5b42),
                            ),
                          ),
                          TextSpan(
                            text: '를 소개합니다!',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left, // 왼쪽 정렬
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset('assets/images/first.png',
                    height: 275, // 적절한 이미지 크기 설정
                    width: 275,
                    fit: BoxFit.contain),
                const SizedBox(height: 35),
                // Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff0b5b42),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SecondScreen()), // 다음 페이지로 이동
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0b5b42),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  '다음으로',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
