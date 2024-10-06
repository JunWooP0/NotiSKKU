import 'package:flutter/material.dart';

class SearchMajor extends StatefulWidget {
  const SearchMajor({
    super.key,
    required this.onSearchChanged,
  });

  final ValueChanged<String> onSearchChanged;

  @override
  State<StatefulWidget> createState() {
    return _SearchMajorState();
  }
}

class _SearchMajorState extends State<SearchMajor> {
  // TextEditingController를 State 클래스에 선언
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    // 메모리 누수를 방지하기 위해 컨트롤러 해제
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF0B5B42),
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                hintText: '검색어를 입력하세요.',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFD9D9D9),
                ),
                counterText: '', // 최대 입력 길이 표시 숨기기
                border: InputBorder.none, // 밑줄 스타일 제거
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onChanged: (value) {
                widget.onSearchChanged(value); // 부모에게 상태 전달
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 37,
              color: Color(0xFF0B5B42),
            ),
          )
        ],
      ),
    );
  }
}
