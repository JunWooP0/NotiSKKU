import 'package:flutter/material.dart';

class TextSecond extends StatelessWidget {
  final double screenWidth;

  const TextSecond({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Row(
            children: [
              const Text(
                '공지사항도 내 스타일로!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontFamily: 'GmarketSans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 5),
              Image.asset(
                'assets/images/magic_wand.png',
                height: screenWidth * 0.075, // Responsive image size
                width: screenWidth * 0.075,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: const Text(
              '원하는 소식만 확인할 수 있어요.',
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
      ],
    );
  }
}
