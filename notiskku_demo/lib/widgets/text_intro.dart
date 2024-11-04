import 'package:flutter/material.dart';

class TextIntro extends StatelessWidget {
  final double screenWidth;

  const TextIntro({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: const Text(
              '성균관대 공지사항 어플',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'GmarketSans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: const Row(
            children: [
              Text(
                'NotiSKKU',
                style: TextStyle(
                  color: Color(0xff0b5b42),
                  fontSize: 30,
                  fontFamily: 'GmarketSans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '를 소개합니다!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'GmarketSans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
