import 'package:flutter/material.dart';
import 'package:notiskku_demo/models/notice.dart';
import 'package:notiskku_demo/notice_functions/launch_url.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/providers/starred_provider.dart';
import 'package:notiskku_demo/screens/edit_keyword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notiskku_demo/notice_functions/fetch_notice.dart';

class SecondPage extends ConsumerStatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends ConsumerState<SecondPage> {
  int selectedCategoryIndex = 0;
  List<String> categories = [];
  List<bool> isStarred = [];
  bool isEditing = false;

  final NoticeService noticeService = NoticeService(); // NoticeService 인스턴스 생성
  late Future<List<Notice>> noticesFuture; // Future로 공지사항 리스트를 관리
  final LaunchUrlService launchUrlService =
      LaunchUrlService(); // LaunchUrlService 인스턴스 생성

  @override
  void initState() {
    super.initState();
    _loadKeywords();
    noticesFuture =
        noticeService.fetchNotices(_getCategoryUrl(0)); // fetchNotices 호출
  }

  Future<void> _loadKeywords() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      categories =
          prefs.getStringList('selectedKeywords') ?? ['Default Keyword'];
    });
  }

  String _getCategoryUrl(int index) {
    return 'https://www.skku.edu/skku/campus/skk_comm/notice01.do';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/greenlogo_fix.png', width: 40),
        ),
        title: const Text(
          '키워드',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // 타이틀 중앙 정렬
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => const StartScreen()),
                          MaterialPageRoute(
                              builder: (context) => const EditKeyword()),
                        );
                      },
                      child: const Text(
                        '편집',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(categories.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                    noticesFuture = noticeService.fetchNotices(
                                        _getCategoryUrl(0)); // fetchNotices 호출
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 33, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: selectedCategoryIndex == index
                                        ? Color(0xB20B5B42)
                                        : Color(0x99D9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                      color: selectedCategoryIndex == index
                                          ? Colors.white
                                          : Colors.black,
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
                  isStarred = List.generate(notices.length, (index) => false);

                  return ListView.builder(
                    itemCount: notices.length,
                    itemBuilder: (context, index) {
                      final notice = notices[index];
                      final isStarred =
                          ref.watch(starredProvider).contains(notice.url);
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              notice.title,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            subtitle:
                                Text('${notice.date} | 조회수: ${notice.views}'),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ref.read(starredProvider.notifier).toggleNotice(notice);
                                });
                              },
                              child: Image.asset(
                                ref
                                        .watch(starredProvider)
                                        .contains(notice.url) // 상태를 바탕으로 별표 표시
                                    ? 'assets/images/fullstar_fix.png'
                                    : 'assets/images/emptystar_fix.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            onTap: () async {
                              await launchUrlService.launchURL(
                                  notice.url); // LaunchUrlService를 사용하여 URL 열기
                            },
                          ),
                          const Divider(
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
}
