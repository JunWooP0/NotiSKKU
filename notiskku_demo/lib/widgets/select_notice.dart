//학과 및 키워드 선택 안내문 
/* 기존 코드, 고정 크기 글자 크기 작음
import 'package:flutter/material.dart';

class SelectNotice extends StatelessWidget {

  const SelectNotice ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment(-0.4, 0),
      child: Text(
        '관심 학과와 키워드를 선택해주세요😀\n(학과는 최대 2개까지 가능)',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.3,
          fontFamily: 'GmarketSans',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class SelectNotice extends StatelessWidget {
  const SelectNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // LayoutBuilder를 사용하여 화면 크기에 맞게 상대적인 위치와 크기 계산
        return FractionallySizedBox(
          widthFactor: 0.8, // 화면 너비의 80%로 위젯 너비 설정
          child: Align(
            alignment: const Alignment(-1.0, 0), // 상대적인 정렬, 완전히 왼쪽(-1.0)
            child: Text(
              '관심 학과와 키워드를 선택해주세요😀\n(학과는 최대 2개까지 가능)',
              textAlign: TextAlign.left, //텍스트 왼쪽 정렬
              style: TextStyle(
                color: Colors.black.withOpacity(0.8999999761581421),
                fontSize: constraints.maxWidth * 0.04, // 화면 너비의 4%로 폰트 크기 설정
                fontFamily: 'GmarketSans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
