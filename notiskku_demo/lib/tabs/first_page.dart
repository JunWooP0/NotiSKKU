import 'package:flutter/material.dart';
import 'package:notiskku_demo/models/notice.dart';
import 'package:notiskku_demo/notice_functions/fetch_notice.dart';
import 'package:notiskku_demo/providers/starred_provider.dart';
import 'package:notiskku_demo/screens/home/search_notice.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/providers/major_provider.dart';


class FirstPage extends ConsumerStatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends ConsumerState<FirstPage> {
  int selectedCategoryIndex = 0;
  final List<String> categories0 = ['학교', '단과대학', '학과'];
  int selectedIndex = 0;
  final List<String> categories = [
    '전체',
    '학사',
    '입학',
    '취업',
    '채용/모집',
    '장학',
    '행사/세미나',
    '일반'
  ];
  List<bool> isStarred = [];
  late Future<List<Notice>> noticesFuture;
  final NoticeService noticeService = NoticeService(); // NoticeService 인스턴스 생성

  @override
  void initState() {
    super.initState();
    noticesFuture =
        noticeService.fetchNotices(_getCategoryUrl(0)); // fetchNotices 호출
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
    final selectedMajors = ref.watch(majorProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
        title: Image.asset('assets/images/greenlogo.png', width: 40),
        // 여기 피그마에서는 학과명 뜨는거로 해뒀는데 학과명이 길어지면 UI가 구려져서 일단 주석해둠 -채연
                    //  Text(
                    //   selectedMajors.isNotEmpty ? selectedMajors.join(', ') : '학과를 선택하세요',
                    //   style: const TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black,
                    //   ),
                    // ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchNoticeScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset('assets/images/search.png', width: 40),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(categories0.length * 2 - 1, (index) {
                  if (index % 2 == 1) {
                    return Container(width: 1.5, height: 20, color: Colors.grey[600]);
                  } else {
                    int categoryIndex = index ~/ 2;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() { selectedCategoryIndex = categoryIndex; });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: selectedCategoryIndex == categoryIndex
                                ? Color(0xFFE8F5E9) : Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(
                              categories0[categoryIndex],
                              style: TextStyle(
                                color: selectedCategoryIndex == categoryIndex
                                    ? Color(0xFF0B5B42) : Colors.grey,
                                fontWeight: selectedCategoryIndex == categoryIndex
                                    ? FontWeight.bold : FontWeight.normal,
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
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            noticesFuture = noticeService.fetchNotices(_getCategoryUrl(index));
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 4),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Color(0xB20B5B42) : Color(0x99D9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Notice>>(
        future: noticesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Failed to load notices'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No notices available'));
          } else {
            final notices = snapshot.data!;
            return ListView.builder(
              itemCount: notices.length,
              itemBuilder: (context, index) {
                final notice = notices[index];
                final isStarred = ref.watch(starredProvider).contains(notice.url);

                return Column(
                  children: [
                    ListTile(
                      title: Text(notice.title, style: TextStyle(fontSize: 17)),
                      subtitle: Text('${notice.date} | 조회수: ${notice.views}'),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            ref.read(starredProvider.notifier).toggleUrl(notice.url);
                          });
                        },
                        child: Image.asset(
                          isStarred ? 'assets/images/fullstar.png' : 'assets/images/emptystar.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      onTap: () => _launchURL(notice.url),
                    ),
                    Divider(color: Colors.grey, thickness: 1, indent: 16, endIndent: 16),
                  ],
                );
              },
            );
          }
        },
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
