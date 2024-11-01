import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/greenlogo.png',
                      width: 40,
                    ),
                    const Text(
                      '학사일정',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/to_be_implemented.png'),
                  const SizedBox(height: 20,),
                  const Text(
                    '서비스 준비 중입니다',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 21,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
