/*
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0b5b42),
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        '다음으로',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff0b5b42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11),
              Text(
                '다음으로',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 11),
            ],
          ),
        ),
      ),
    );
  }
}
