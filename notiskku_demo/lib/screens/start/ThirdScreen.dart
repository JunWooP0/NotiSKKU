import 'package:flutter/material.dart';
import 'package:notiskku_demo/widgets/setup_skip_button.dart';
import 'package:notiskku_demo/widgets/setup_major_button.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '중요한 소식, 내가 먼저!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Image.asset(
                        'images/medal.png',
                        height: 30,
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
                    const SizedBox(width: 15),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff0b5b42),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Column(
                children: const [
                  SetupSkipButton(),
                  SizedBox(height: 20),
                  SetMajorButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
