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
