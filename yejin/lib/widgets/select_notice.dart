//학과 및 키워드 선택 안내문 
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
