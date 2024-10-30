//'선택하지 않음' 버튼 
//이 버튼 누르면 키워드 설정 없어도
//'설정 완료' 버튼 활성화

import 'package:flutter/material.dart';

class DoNotSelect extends StatefulWidget {
  const DoNotSelect({
    super.key,
    required this.selectedMajor,
  });

  final List<String> selectedMajor;

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
          onPressed: widget.selectedMajor.isEmpty
              ? () {
                  // Do something when no major is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No major selected')),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.selectedMajor.isEmpty
                ? const Color(0xFF0B5B42)
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
