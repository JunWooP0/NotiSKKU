//select majors and keywords

import 'package:flutter/material.dart';
import 'package:notiskku_demo/widgets/major_list.dart';
import 'package:notiskku_demo/widgets/keywords_grid.dart';
import 'package:notiskku_demo/widgets/setup_complete_button.dart';
import 'package:notiskku_demo/widgets/major_keyword_button.dart';

class SelectMajorScreen extends StatefulWidget {
  const SelectMajorScreen({super.key});

  @override
  State<SelectMajorScreen> createState() => _SelectMajorScreenState();
}

class _SelectMajorScreenState extends State<SelectMajorScreen> {
  //상태관리
  int _currentIndex = 0;
  List<String> selectedMajor = []; // 선택된 전공을 저장할 리스트
  List<String> selectedKeyword = []; // 선택된 키워드를 저장할 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //flutter 기본 화면 레이아웃
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 80),
          
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                '관심 학과와 키워드를 선택해주세요😀\n(학과는 최대 2개까지 가능)',
                textAlign: TextAlign.left, //텍스트 왼쪽 정렬
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8999999761581421),
                  fontSize: 25,
                  fontFamily: 'GmarketSans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
            //남은 공간 최대한 활용
            child: _currentIndex == 0
                ? MajorList(
                    selectedMajor: selectedMajor,
                    onSelectedMajorChanged: (majors) {
                      setState(() {
                        selectedMajor = majors; // 선택된 전공 업데이트
                      });
                    },
                  )
                : KeywordsGrid(
                    selectedKeyword: selectedKeyword,
                    onselectedKeywordChanged: (keywords){
                      setState(() {
                        selectedKeyword = keywords;
                      });
                    },
                  ),
          ),
          const SizedBox(height: 30),
          SetupCompleteButton(
            selectedMajor: selectedMajor,
            selectedKeyword: selectedKeyword,
          ),
        ],
      ),
    );
  }
}
