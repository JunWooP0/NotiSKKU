//키워드를 그리드 형태로 표현하기 위한 위젯
/* 기존 코드(chaeyeon)
import 'package:yejin/data/keyword_data.dart';
import 'package:yejin/models/keyword.dart';
import 'package:yejin/widgets/keywords_grid_item.dart';
import 'package:flutter/material.dart';

class KeywordsGrid extends StatefulWidget{
  const KeywordsGrid({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KeywordsGridState();
  }
}

class _KeywordsGridState extends State<KeywordsGrid>{

  void _selectKeyword (BuildContext context, Keyword keyword) { //키워드가 선택되었을 때 실행됨

  //(구현 예정 ... ...)
   
  }


  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 40,),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final keyword in keywords)
          KeywordsGridItem(
            keyword: keyword,
            onSelectKeyword: (){
              _selectKeyword(context, keyword);
            } ,
          )
      ],
    );
  }
}
*/

/*
//GridView() 이용
import 'package:flutter/material.dart';
import 'package:yejin/data/keyword_data.dart';
import 'package:yejin/models/keyword.dart';

class KeywordsGrid extends StatefulWidget {
  const KeywordsGrid({
    super.key,
    required this.selectedKeyword,
    required this.onselectedKeywordChanged,
  });

  final List<String> selectedKeyword;
  final Function(List<String>) onselectedKeywordChanged;

  @override
  State<StatefulWidget> createState() {
    return _KeywordsGridState();
  }
}

class _KeywordsGridState extends State<KeywordsGrid> {
  List<String> selectedKeywords = [];
  // keywords 리스트에 있는 각 Keyword 객체의 keyword 속성만을 추출하여 문자열 리스트로

  void _selectKeyword(BuildContext context, Keyword keyword) {
    setState(() {
      if (selectedKeywords.contains(keyword.keyword)) {
        selectedKeywords.remove(keyword.keyword); // 선택된 버튼 해제
      } else {
        selectedKeywords.add(keyword.keyword); // 버튼 선택
      }

      widget.onselectedKeywordChanged(widget.selectedKeyword);
    });
  }

@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width; // 화면 너비 가져오기
  final buttonWidth = (screenWidth - 80) / 3; // 버튼 너비 조정 (여백을 고려하여 3개로 나누기)
  
  // 비율 86:37로 버튼 높이 계산
  final buttonHeight = buttonWidth * (37 / 86); 

  return Scaffold(
    // appBar: AppBar(title: Text("버튼 선택")),
    backgroundColor: Colors.white,
    body: Column(
      children: [
        
        const SizedBox(height: 20), // 여백 추가
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: screenWidth * 0.075), // 여백 조정
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: (buttonWidth/buttonHeight),
              crossAxisSpacing: 19,
              mainAxisSpacing: 30,
            ),
            itemCount: keywords.length,
            itemBuilder: (context, index) {
              final keywordObj = keywords[index];
              bool isSelected = selectedKeywords.contains(keywordObj.keyword);
              return GestureDetector(
                onTap: () => _selectKeyword(context, keywordObj),
                child: Container(
                  width: buttonWidth, // 동적 버튼 너비
                  height: buttonHeight, // 동적 버튼 높이
                  padding: const EdgeInsets.all(10), // 버튼 안쪽 여백
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xB20B5B42) : const Color(0x99D9D9D9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      keywordObj.keyword,
                      style: TextStyle(
                        fontSize: buttonWidth * 0.15, // 버튼 너비에 따라 텍스트 크기 조정
                        color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF979797),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // const SizedBox(height: 20),
        // ElevatedButton(
        //   onPressed: () {
        //     // 선택된 버튼 리스트 출력
        //     print("선택된 버튼: $selectedKeywords");
        //   },
        //   child: Text("설정 완료"),
        // ),
      ],
    ),
  );
}

}
*/

import 'package:flutter/material.dart';
import 'package:notiskku_demo/data/keyword_data.dart';
import 'package:notiskku_demo/models/keyword.dart';

class KeywordsGrid extends StatefulWidget {
  const KeywordsGrid({
    super.key,
    required this.selectedKeyword,
    required this.onselectedKeywordChanged,
  });

  final List<String> selectedKeyword;
  final Function(List<String>) onselectedKeywordChanged;

  @override
  State<StatefulWidget> createState() {
    return _KeywordsGridState();
  }
}

class _KeywordsGridState extends State<KeywordsGrid> {
  List<String> selectedKeywords = [];

  void _selectKeyword(BuildContext context, Keyword keyword) {
    setState(() {
      if (selectedKeywords.contains(keyword.keyword)) {
        selectedKeywords.remove(keyword.keyword); // 선택된 버튼 해제
      } else {
        selectedKeywords.add(keyword.keyword); // 버튼 선택
      }

      widget.onselectedKeywordChanged(widget.selectedKeyword);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // 화면 너비 가져오기
    final buttonWidth = (screenWidth - 80) / 3; // 버튼 너비 조정 (여백을 고려하여 3개로 나누기)

    // 비율 86:37로 버튼 높이 계산
    final buttonHeight = buttonWidth * (37 / 86);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20), // 상단 여백 추가
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.075), // 좌우 7.5% 여백 설정
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (buttonWidth / buttonHeight),
                crossAxisSpacing: 19,
                mainAxisSpacing: 30,
              ),
              itemCount: keywords.length,
              itemBuilder: (context, index) {
                final keywordObj = keywords[index];
                bool isSelected = selectedKeywords.contains(keywordObj.keyword);
                return GestureDetector(
                  onTap: () => _selectKeyword(context, keywordObj),
                  child: Container(
                    width: buttonWidth, // 동적 버튼 너비
                    height: buttonHeight, // 동적 버튼 높이
                    padding: const EdgeInsets.all(10), // 버튼 안쪽 여백
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xB20B5B42) : const Color(0x99D9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        keywordObj.keyword,
                        style: TextStyle(
                          fontSize: buttonWidth * 0.15, // 버튼 너비에 따라 텍스트 크기 조정
                          color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF979797),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


