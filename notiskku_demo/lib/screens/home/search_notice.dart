import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/providers/search_words_provider.dart';
import 'package:notiskku_demo/screens/home/mainhome.dart';
import 'package:notiskku_demo/widgets/recent_search.dart';
import 'package:notiskku_demo/widgets/search_major.dart';
import 'package:notiskku_demo/widgets/search_notice_word.dart';

class SearchNoticeScreen extends ConsumerStatefulWidget {
  const SearchNoticeScreen({super.key});

  @override
  _SearchNoticeScreenState createState() => _SearchNoticeScreenState();
}

class _SearchNoticeScreenState extends ConsumerState<SearchNoticeScreen> {
  String searchText = '';
  bool isSearched = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // 왼쪽 뒤로 가기 버튼
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainHomePage(),
                        ));
                  },
                  child: Image.asset('assets/images/go_back.png', width: 40),
                ),

                // 중앙에 텍스트 배치
                const Expanded(
                  child: Text(
                    '검색',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SearchNoticeWord(
            onSearchChanged: (newText) {
              setState(() {
                searchText = newText;
                isSearched = newText.isNotEmpty;
              });
            },
          ),
          const SizedBox(height: 10),

          // isSearched 상태에 따라 다른 위젯 표시
          if (!isSearched)
            // 최근 검색 내역 (isSearched가 false일 때)
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '최근 검색 내역',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          else
            // 검색 결과 (isSearched가 true일 때)
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '검색 결과',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          const SizedBox(height: 8),

          // isSearched 상태에 따른 컨텐츠 (최근 검색 내역 또는 검색 결과)
          Expanded(
            child: isSearched
                ? ListView.builder(
                    itemCount: 10, // 검색 결과의 개수를 설정
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('검색 결과 #$index'),
                        subtitle: Text('검색어 "$searchText"에 대한 결과입니다.'),
                      );
                    },
                  )
                : RecentSearch(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
