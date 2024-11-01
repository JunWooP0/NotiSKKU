//'선택하지 않음' 버튼 
//이 버튼 누르면 키워드 설정 없어도
//'설정 완료' 버튼 활성화

/*
import 'package:flutter/material.dart';

class DoNotSelect extends StatefulWidget {
  const DoNotSelect({
    super.key,
    required this.onSelected,
    
  });

  final bool onSelected;
  @override
  State<DoNotSelect> createState() => _DoNotSelectState();
}

class _DoNotSelectState extends State<DoNotSelect> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: ElevatedButton(
          onPressed: () { },
             
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.onSelected
                ? const Color(0xB20B5B42)
                : const Color(0xFF979797),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11),
              Text(
                '선택하지 않음',
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
*/

import 'package:flutter/material.dart';

class DoNotSelect extends StatelessWidget {
  const DoNotSelect({
    super.key,
    required this.onPressed,
    required this.isSelected,
  });

  final void Function() onPressed; // Callback when button is pressed
  final bool isSelected; // Current state of the button

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: ElevatedButton(
          onPressed: onPressed, // Call the provided callback
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? const Color(0xB20B5B42)
                : const Color(0xFF979797),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 11),
              Text(
                '선택하지 않음',
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
