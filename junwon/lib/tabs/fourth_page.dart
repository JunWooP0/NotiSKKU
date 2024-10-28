import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 상단 바
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/greenlogo.png', width: 40),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0), // 텍스트만 약간 아래로 이동
                    child: const Text(
                      '학사일정',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/fix.png', // 이미지 파일 경로
                  width: 80, // 크기 설정
                  height: 80,
                  color: Colors.grey[400], // 색상 적용 (필요시)
                ),
                SizedBox(height: 10),
                Text(
                  '서비스 준비 중입니다',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
