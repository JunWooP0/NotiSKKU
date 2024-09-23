import 'package:flutter/material.dart';

class SelectDepartment extends StatefulWidget {
  const SelectDepartment({super.key});

  @override
  State<SelectDepartment> createState() {
    return _SelectDepartmentState();
  }
}

class _SelectDepartmentState extends State<SelectDepartment> {
  int _selectedIndex = 0;

  Widget _buildButton(int index, String text) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? const Color(0xFF0B5B42)
                  : const Color(0xFF979797),
              width: 3.0, // 강조선 두께
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected
                  ? const Color(0xFF0B5B42)
                  : const Color(0xFF979797),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Text(
            '관심 학과와 키워드를 선택해주세요😀\n(학과는 최대 2개까지 가능)',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'GmarketSans',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(0, "학과"),
              const SizedBox(width: 20), // 버튼 간 간격
              _buildButton(1, "키워드"),
            ],
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
