import 'package:flutter/material.dart';
import 'package:notiskku_demo/models/notice.dart';
import 'package:notiskku_demo/notice_functions/fetch_notice.dart';
import 'package:notiskku_demo/notice_functions/launch_url.dart';
import 'package:notiskku_demo/providers/starred_provider.dart';
import 'package:notiskku_demo/screens/home/search_notice.dart';
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
  Future<List<Notice>>? noticesFuture; // nullable로 수정
  final NoticeService noticeService = NoticeService();
  final LaunchUrlService launchUrlService = LaunchUrlService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // noticesFuture가 null인 경우, 초기 로딩 수행
    if (noticesFuture == null) {
      final selectedMajors = ref.watch(majorProvider);
      final majorOrDepartment =
          selectedMajors.isNotEmpty ? selectedMajors[0] : '';
      noticesFuture =
          noticeService.fetchNotices(_getCategoryUrl(0, majorOrDepartment));
    }
  }

// 카테고리나 학과 선택 시 호출될 메소드
  void _updateNotices() {
    final selectedMajors = ref.watch(majorProvider);
    final majorOrDepartment =
        selectedMajors.isNotEmpty ? selectedMajors[0] : '';

    setState(() {
      noticesFuture = noticeService
          .fetchNotices(_getCategoryUrl(selectedIndex, majorOrDepartment));
    });
  }

  String _getCategoryUrl(int index, String majorOrDepartment) {
    // 소프트웨어학과의 경우 조건에 맞는 URL 반환
    if (majorOrDepartment == '소프트웨어학과') {
      if (selectedCategoryIndex == 2) {
        // 학과 선택 시
        switch (index) {
          case 1:
            return 'https://cse.skku.edu/cse/notice.do?mode=list&srCategoryId1=1582';
          case 2:
            return 'https://cse.skku.edu/cse/notice.do?mode=list&srCategoryId1=1583';
          case 3:
            return 'https://cse.skku.edu/cse/notice.do?mode=list&srCategoryId1=1584';
          case 4:
            return 'https://cse.skku.edu/cse/notice.do?mode=list&srCategoryId1=1585';
          case 5:
            return 'https://cse.skku.edu/cse/notice.do?mode=list&srCategoryId1=1586';
          case 6:
            return 'https://cse.skku.edu/cse/notice.do?mode=list&srCategoryId1=1587';
          case 7:
            return 'https://cse.skku.edu/cse/notice.do?mode=list&srCategoryId1=1588';
          default:
            return 'https://cse.skku.edu/cse/notice.do?mode=list';
        }
      } else if (selectedCategoryIndex == 1) {
        // 단과대학 선택 시
        switch (index) {
          case 1:
            return 'https://sw.skku.edu/sw/notice.do?mode=list&srCategoryId1=1582';
          case 2:
            return 'https://sw.skku.edu/sw/notice.do?mode=list&srCategoryId1=1583';
          case 3:
            return 'https://sw.skku.edu/sw/notice.do?mode=list&srCategoryId1=1584';
          case 4:
            return 'https://sw.skku.edu/sw/notice.do?mode=list&srCategoryId1=1585';
          case 5:
            return 'https://sw.skku.edu/sw/notice.do?mode=list&srCategoryId1=1586';
          case 6:
            return 'https://sw.skku.edu/sw/notice.do?mode=list&srCategoryId1=1587';
          case 7:
            return 'https://sw.skku.edu/sw/notice.do?mode=list&srCategoryId1=1588';
          case 8:
            return 'https://sw.skku.edu/sw/notice.do?mode=list&srCategoryId1=1589';
          default:
            return 'https://sw.skku.edu/sw/notice.do';
        }
      }
    }

    // 소프트웨어학과가 아닌 경우, selectedCategoryIndex가 1 또는 2여도 학교 선택처럼 작동
    if (selectedCategoryIndex == 0 ||
        selectedCategoryIndex == 1 ||
        selectedCategoryIndex == 2) {
      switch (index) {
        case 1:
          return 'https://www.skku.edu/skku/campus/skk_comm/notice02.do';
        case 2:
          return 'https://www.skku.edu/skku/campus/skk_comm/notice03.do';
        case 3:
          return 'https://www.skku.edu/skku/campus/skk_comm/notice04.do';
        case 4:
          return 'https://www.skku.edu/skku/campus/skk_comm/notice05.do';
        case 5:
          return 'https://www.skku.edu/skku/campus/skk_comm/notice06.do';
        case 6:
          return 'https://www.skku.edu/skku/campus/skk_comm/notice07.do';
        case 7:
          return 'https://www.skku.edu/skku/campus/skk_comm/notice08.do';
        default:
          return 'https://www.skku.edu/skku/campus/skk_comm/notice01.do';
      }
    }

    // 기본 URL 반환
    return 'https://defaulturl.com';
  }

  @override
  Widget build(BuildContext context) {
    final selectedMajors = ref.watch(majorProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/greenlogo_fix.png', width: 40),
        ),
        title: selectedMajors.isNotEmpty
            ? Text(
                selectedMajors.join(', '),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                overflow:
                    TextOverflow.ellipsis, // to handle long names gracefully
              )
            : const Text(
                '학과를 선택하세요',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchNoticeScreen(),
                  ),
                );
              },
              child: Image.asset('assets/images/search_fix.png', width: 30),
            ),
          ),
        ],
        centerTitle: true, // 타이틀 중앙 정렬
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 상단 바
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
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
                              _updateNotices();
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
                const SizedBox(height: 10),
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

                                    // selectedMajors를 가져오기 위해 build 메소드에서 선언한 selectedMajors를 활용합니다.
                                    final selectedMajors =
                                        ref.watch(majorProvider);
                                    final majorOrDepartment =
                                        selectedMajors.isNotEmpty
                                            ? selectedMajors[0]
                                            : '';

                                    // 선택된 카테고리 URL에 따라 noticesFuture를 업데이트합니다.
                                    noticesFuture = noticeService.fetchNotices(
                                        _getCategoryUrl(
                                            index, majorOrDepartment));
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
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
                )
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
                  print('Error: ${snapshot.error}'); // 오류 메시지 출력
                  return Center(
                      child: Text('Failed to load notices -- second case'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No notices available'));
                } else {
                  final notices = snapshot.data!;

                  return ListView.builder(
                    itemCount: notices.length,
                    itemBuilder: (context, index) {
                      final notice = notices[index];
                      final isStarred = ref.watch(starredProvider);

                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              notice.title,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            subtitle: Text(
                                '${notice.date} | 조회수: ${notice.views}'), // 날짜와 조회수 함께 표시
                            trailing: GestureDetector(
                              onTap: () {
                                ref
                                    .read(starredProvider.notifier)
                                    .toggleNotice(notice);
                              },
                              child: Image.asset(
                                isStarred.any((n) => n.url == notice.url)
                                    ? 'assets/images/fullstar_fix.png'
                                    : 'assets/images/emptystar_fix.png',
                                width: 26,
                                height: 26,
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
