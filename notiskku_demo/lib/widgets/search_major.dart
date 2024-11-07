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
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 크기를 MediaQuery로 가져옵니다.
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.075), 
      padding: const EdgeInsets.symmetric(horizontal: 15), // 항상 같은 크기
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
                counterText: '',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onChanged: (value) {
                widget.onSearchChanged(value);
              },
            ),
          ),
          GestureDetector(
            onTap: (){
              _titleController.clear();
              widget.onSearchChanged('');
            },
            child: Image.asset('assets/images/erase.png'),
          ),
          const SizedBox(width: 5,),
          const Icon(
            Icons.search, 
            size: 37,
            color: Color(0xFF0B5B42),
          ),
        ],
      ),
    );
  }
}

