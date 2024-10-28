import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/select_major.dart';

class SetMajorButton extends StatelessWidget {
  const SetMajorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SelectMajorScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0b5b42),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        '학과/키워드 설정하기',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
