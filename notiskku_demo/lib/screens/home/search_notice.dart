import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/home/mainhome.dart';
import 'package:notiskku_demo/widgets/search_major.dart';

class SearchNoticeScreen extends StatefulWidget {
  const SearchNoticeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchNoticeScreenState();
  }
}

class _SearchNoticeScreenState extends State<SearchNoticeScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                  child: const Text(
                    '검색',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                // 오른쪽 검색 아이콘
                const SizedBox(width: 40,),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SearchMajor(
            onSearchChanged: (newText) {
              setState(() {
                searchText = newText;
              });
            },
          ),
          const SizedBox(height: 10),
          const Text('최근 검색 내역'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
