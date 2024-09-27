import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20), // Optional space for top padding
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      '성균관대 공지사항 어플',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5), // 약간의 간격 추가
                // 'NotiSKKU를 소개합니다!' 부분의 스타일을 분리하여 적용
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Noti',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.green,
                            ),
                          ),
                          const TextSpan(
                            text: 'SKKU',
                            style: TextStyle(
                              fontSize: 30, // 크기 약간 더 크게 설정
                              fontWeight: FontWeight.w900,
                              color: Colors.green, // 초록색
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
                      textAlign: TextAlign.left,  // 왼쪽 정렬
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/first.png',
                  height: 275, // 적절한 이미지 크기 설정
                  width: 275,
                  fit: BoxFit.contain
                ),
                SizedBox(height: 35),
                // Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 11, 56, 24),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
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
                  // 다음 화면으로 이동하는 로직 작성
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 17, 60, 18), // primary 대신 backgroundColor 사용
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  '다음으로',
                  style: TextStyle(fontSize: 24,
                  color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
