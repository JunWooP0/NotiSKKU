import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/startScreen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 100),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // 이미지와 텍스트의 수직 정렬
                    children: [
                      const Text(
                        '중요한 소식, 내가 먼저!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 7), // 텍스트와 이미지 사이의 간격 조절
                      Image.asset(
                        'images/medal.png',
                        height: 30, // 이미지 크기 설정
                        width: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '띠링~ 필요한 알림만 받을 수 있어요.',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // ThirdScreen에 표시할 이미지
                Image.asset(
                  'assets/images/third.png',
                  height: 275,
                  width: 275,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey, // indicator 색상 변경
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
                        color: Color(0xff0b5b42), // 마지막 indicator 활성화
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                       // "다음에 설정하기" 버튼을 누르면 startScreen으로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.grey, // "다음에 설정하기" 버튼의 배경색 (회색 예시)
                      padding: const EdgeInsets.symmetric(
                          horizontal: 125, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '다음에 설정하기',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20), // 버튼 간의 간격 추가
                  ElevatedButton(
                    onPressed: () {
                      // 학과/키워드 설정하기 버튼 동작
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0b5b42),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '학과/키워드 설정하기',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
