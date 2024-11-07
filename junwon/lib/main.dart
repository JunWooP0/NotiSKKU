import 'package:flutter/material.dart';
import 'tabs/first_page.dart'; // 분리된 첫 번째 페이지
import 'tabs/second_page.dart'; // 분리된 두 번째 페이지
import 'tabs/third_page.dart'; // 분리된 세 번째 페이지
import 'tabs/fourth_page.dart'; // 분리된 네 번째 페이지
import 'tabs/fifth_page.dart'; // 분리된 다섯 번째 페이지

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 기본 배경색을 하얀색으로 설정
      ),
      home: const MainHomePage(),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;

  // 각 인덱스에 맞는 페이지를 정의합니다.
  static List<Widget> _pages = <Widget>[
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage(),
    FifthPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 선택한 페이지가 여기에 표시됩니다.
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10), // 네비게이션 바를 살짝 위로 올리기 위한 패딩
        decoration: const BoxDecoration(
          color: Colors.white, // 회색 공간 대신 네비게이션 바와 동일한 배경색 사용
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 모든 항목을 고정 비율로 보여주기
          elevation: 0, // 그림자 제거
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/notice.png')), // 이미지로 아이콘을 표시
              label: '공지사항',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/keyword.png')), // 두 번째 아이콘
              label: '키워드',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/bogwan.png')), // 세 번째 아이콘
              label: '공지함',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/calendar.png')), // 네 번째 아이콘
              label: '학사일정',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/more.png')), // 다섯 번째 아이콘
              label: '더보기',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF0B5B42),
          unselectedItemColor: Colors.grey,
          iconSize: 55, // 아이콘 크기 설정
          selectedFontSize: 14, // 선택된 항목의 폰트 크기
          unselectedFontSize: 14, // 선택되지 않은 항목의 폰트 크기
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
