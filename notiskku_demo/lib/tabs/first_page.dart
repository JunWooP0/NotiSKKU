import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class Notice {
  final String title;
  final String url;
  final String date;
  final String views; // 조회수 필드 추가

  Notice({required this.title, required this.url, required this.date, required this.views});
}

Future<List<Notice>> fetchNotices(String url) async {
  final response = await http.get(Uri.parse(url));

   if (response.statusCode == 200) {
    var document = parser.parse(response.body);
    var noticeElements = document.querySelectorAll('dt.board-list-content-title a');
    var infoElements = document.querySelectorAll('dd.board-list-content-info ul'); // 날짜 정보 포함된 태그

    List<Notice> notices = [];
    for (int i = 0; i < noticeElements.length; i++) {
      var element = noticeElements[i];
      var infoElement = infoElements[i];

      String title = element.text.trim();
      String relativeUrl = element.attributes['href'] ?? '';
      String url = Uri.parse('https://www.skku.edu/skku/campus/skk_comm/notice01.do').resolve(relativeUrl).toString();

      // 날짜 정보 추출
      var dateElement = infoElement.querySelectorAll('li')[2]; // 세 번째 <li>에서 날짜 추출
      String date = dateElement.text.trim();

      var viewsElement = infoElement.querySelectorAll('li')[3]; // 네 번째 <li>에서 조회수 추출
      String views = viewsElement.text.trim().replaceAll('조회수', '').trim();

      notices.add(Notice(title: title, url: url, date: date, views: views));
    }

    return notices;
  } else {
    throw Exception('Failed to load notices');
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedCategoryIndex = 0;
  final List<String> categories0 = ['학교', '단과대학', '학과'];
  int selectedIndex = 0;
  final List<String> categories = ['전체', '학사', '입학', '취업', '채용/모집', '장학', '행사/세미나', '일반'];
  List<bool> isStarred = [];
  late Future<List<Notice>> noticesFuture;

  @override
  void initState() {
    super.initState();
    noticesFuture = fetchNotices(_getCategoryUrl(0)); // 초기화 시 '전체' URL 사용
  }

  // 카테고리 인덱스에 따라 URL 반환
  String _getCategoryUrl(int index) {
    switch (index) {
      case 1:
        return 'https://www.skku.edu/skku/campus/skk_comm/notice02.do'; // 학사
      case 2:
        return 'https://www.skku.edu/skku/campus/skk_comm/notice03.do'; // 입학
      case 3:
        return 'https://www.skku.edu/skku/campus/skk_comm/notice04.do'; // 취업
      case 4:
        return 'https://www.skku.edu/skku/campus/skk_comm/notice05.do'; // 취업
      case 5:
        return 'https://www.skku.edu/skku/campus/skk_comm/notice06.do'; // 취업
      case 6:
        return 'https://www.skku.edu/skku/campus/skk_comm/notice07.do'; // 취업
      case 7:
        return 'https://www.skku.edu/skku/campus/skk_comm/notice08.do'; // 취업
      // 필요한 URL 추가
      default:
        return 'https://www.skku.edu/skku/campus/skk_comm/notice01.do'; // 전체
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          // 상단 바
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/greenlogo.png', width: 40),
                    const Text(
                      '학과 명',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset('assets/images/search.png', width: 40),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(categories0.length * 2 - 1, (index) {
                    // 홀수 인덱스에는 구분선을, 짝수 인덱스에는 카테고리를 표시합니다.
                    if (index % 2 == 1) {
                      return Container(
                        width: 1.5, // 구분선의 너비
                        height: 20, // 구분선의 높이
                        color: Colors.grey[600], // 구분선 색상
                      );
                    } else {
                      int categoryIndex = index ~/ 2;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = categoryIndex;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: selectedCategoryIndex == categoryIndex
                                  ? Color(0xFFE8F5E9)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: Text(
                                categories0[categoryIndex],
                                style: TextStyle(
                                  color: selectedCategoryIndex == categoryIndex
                                      ? Color(0xFF0B5B42)
                                      : Colors.grey,
                                  fontWeight:
                                      selectedCategoryIndex == categoryIndex
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // 가로로 스크롤 가능하게 설정
                        child: Row(
                          children: List.generate(categories.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    noticesFuture = fetchNotices(_getCategoryUrl(index)); // 선택된 카테고리 URL에 따라 Future 업데이트
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 33, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? Color(0xB20B5B42) // 선택된 배경색
                                        : Color(0x99D9D9D9), // 기본 배경색
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? Colors.white // 선택된 텍스트 색상
                                          : Colors.black, // 기본 텍스트 색상
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: FutureBuilder<List<Notice>>(
              future: noticesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load notices'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No notices available'));
                } else {
                  final notices = snapshot.data!;
                  isStarred = List.generate(notices.length, (index) => false); // 초기 별표 상태 설정

                  return ListView.builder(
                    itemCount: notices.length,
                    itemBuilder: (context, index) {
                      final notice = notices[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              notice.title,
                              style: TextStyle(fontSize: 17, color: Colors.black),
                            ),
                            subtitle: Text('${notice.date} | 조회수: ${notice.views}'), // 날짜와 조회수 함께 표시
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isStarred[index] = !isStarred[index];
                                });
                              },
                              child: Image.asset(
                                isStarred[index]
                                    ? 'assets/images/fullstar.png'
                                    : 'assets/images/emptystar.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            onTap: () => _launchURL(notice.url), // URL 열기
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}