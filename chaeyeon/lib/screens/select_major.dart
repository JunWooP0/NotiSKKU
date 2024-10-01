import 'package:flutter/material.dart';
import 'package:chaeyeon/widgets/major_list.dart';
import 'package:chaeyeon/widgets/keywords_grid.dart';
import 'package:chaeyeon/widgets/next_button.dart';
import 'package:chaeyeon/widgets/select_notice.dart';
import 'package:chaeyeon/widgets/major_keyword_button.dart';

class SelectMajorScreen extends StatefulWidget {
  const SelectMajorScreen({super.key});

  @override
  State<SelectMajorScreen> createState() => _SelectMajorScreenState();
}

class _SelectMajorScreenState extends State<SelectMajorScreen> {
  int _currentIndex = 0;
  List<String> selectedMajor = []; // 선택된 전공을 저장할 리스트
  List<String> selectedKeyword = []; // 선택된 키워드를 저장할 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 60),
          const SelectNotice(),
          const SizedBox(height: 30),
          MajorKeywordButton(
            currentIndex: _currentIndex,
            onIndexChanged: (newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _currentIndex == 0
                ? MajorList(
                    selectedMajor: selectedMajor,
                    onSelectedMajorChanged: (majors) {
                      setState(() {
                        selectedMajor = majors; // 선택된 전공 업데이트
                      });
                    },
                  )
                : const KeywordsGrid(),
          ),
          const SizedBox(height: 30),
          NextButton(
            selectedMajor: selectedMajor,
            selectedKeyword: selectedKeyword,
          ),
        ],
      ),
    );
  }
}
