import 'package:flutter/material.dart';
import 'package:junwoo/ThirdScreen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // 이미지와 텍스트의 수직 정렬
                    children: [
                      const Text(
                        '공지사항도 내 스타일로!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 10), // 텍스트와 이미지 사이의 간격 조절
                      Image.asset(
                        'images/magic_wand.png',
                        height: 30, // 이미지 크기 설정
                        width: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5), // 약간의 간격 추가
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '원하는 소식만 확인할 수 있어요.',
                            style: TextStyle(
                              fontSize: 22,
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
                // 다른 이미지 사용
                Image.asset(
                  'assets/images/second.png',
                  height: 275, // 적절한 이미지 크기 설정
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
                            const ThirdScreen()), // ThirdScreen으로 이동
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
