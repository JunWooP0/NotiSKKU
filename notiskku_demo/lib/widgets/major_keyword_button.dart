/*
import 'package:flutter/material.dart';

class MajorKeywordButton extends StatefulWidget {
  const MajorKeywordButton({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  final int currentIndex;
  final ValueChanged<int> onIndexChanged; 

  @override
  State<MajorKeywordButton> createState() => _MajorKeywordButtonState();
}

class _MajorKeywordButtonState extends State<MajorKeywordButton> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex; 
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(0, "학과"),
        const SizedBox(width: 20),
        _buildButton(1, "키워드"),
      ],
    );
  }

  Widget _buildButton(int index, String text) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; 
        });
        widget.onIndexChanged(index); 
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF0B5B42) : const Color(0xFF979797),
              width: 2.3,
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? const Color(0xFF0B5B42) : const Color(0xFF979797),
            ),
          ),
        ),
      ),
    );
  }
}
*/

//비율 수정, MediaQuery
import 'package:flutter/material.dart';

class MajorKeywordButton extends StatefulWidget {
  const MajorKeywordButton({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  State<MajorKeywordButton> createState() => _MajorKeywordButtonState();
}

class _MajorKeywordButtonState extends State<MajorKeywordButton> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 크기를 MediaQuery로 가져옵니다.
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(0, "학과", screenWidth * 0.4), // 화면 너비의 40%로 버튼 크기 설정
        SizedBox(width: screenWidth * 0.03), // 버튼 사이에 화면 너비의 3%만큼 여백
        _buildButton(1, "키워드", screenWidth * 0.4), // 화면 너비의 40%로 버튼 크기 설정
      ],
    );
  }

  Widget _buildButton(int index, String text, double buttonWidth) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onIndexChanged(index);
      },
      child: Container(
        width: buttonWidth, // 상대적인 너비 설정
        padding: const EdgeInsets.symmetric(vertical: 10.0), // 기존 패딩 유지, 수직 10만큼 항상 고정
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF0B5B42) : const Color(0xFF979797),
              width: isSelected ? 2.5 : 1, //figma에서는 2.0, 임의로 2.5로 수정함
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20, // 텍스트 크기는 그대로 유지
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w300,
              color: isSelected ? const Color(0xFF0B5B42) : const Color(0xFF979797),
            ),
          ),
        ),
      ),
    );
  }
}
