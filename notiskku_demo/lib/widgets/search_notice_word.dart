import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/providers/search_words_provider.dart';

class SearchNoticeWord extends ConsumerStatefulWidget {
  const SearchNoticeWord({
    super.key,
    required this.onSearchChanged,
  });

  final ValueChanged<String> onSearchChanged;

  @override
  _SearchNoticeWordState createState() {
    return _SearchNoticeWordState();
  }
}

class _SearchNoticeWordState extends ConsumerState<SearchNoticeWord> {
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
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
              onSubmitted: (value) {
                // 키보드에서 완료 버튼을 눌렀을 때 검색어 저장
                if (value.isNotEmpty) {
                  ref.read(searchWordsProvider.notifier).searchWord(value);
                }
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              ref
                  .read(searchWordsProvider.notifier)
                  .searchWord(_titleController.text);
            },
            child: const Icon(
              Icons.search,
              size: 37,
              color: Color(0xFF0B5B42), 
            ),
          ),
        ],
      ),
    );
  }
}
