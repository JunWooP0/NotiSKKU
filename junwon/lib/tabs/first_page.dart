import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedCategoryIndex = 0; // 선택된 카테고리 인덱스 관리
  final List<String> categories0 = ['학교', '단과대학', '학과']; // 카테고리 목록

  int selectedIndex = 0; // 선택된 박스의 인덱스
  // 카테고리 목록
  final List<String> categories = ['전체', '장학', '취업', '학사', '연구', '생활', '기타'];

  // 별표 상태를 관리할 리스트
  List<bool> isStarred =
      List.generate(20, (index) => false); // 5개의 아이템을 false로 초기화

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {}); // 강제로 초기 렌더링을 한번 더 실행
    });
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
                    Image.asset('assets/greenlogo.png', width: 40),
                    const Text(
                      '학과 명',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset('assets/search.png', width: 40),
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
                                    selectedIndex = index; // 선택된 인덱스 업데이트
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
            child: ListView.builder(
              itemCount:
                  isStarred.length + 1, // 항목 수에 1을 추가하여 맨 위에 Divider 공간 추가
              itemBuilder: (context, index) {
                if (index == 0) {
                  // 첫 번째 Divider를 추가하는 경우
                  return Divider(
                    color: Colors.grey, // 구분선 색상 설정
                    thickness: 1, // 구분선 두께 설정
                    indent: 16,
                    endIndent: 16,
                  );
                }
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        '[학사] 2024학년도 도전학기 혁신융합수업 (정규교과) 기말강의평가 시행 안내',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text('2024-08-14'),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            isStarred[index] =
                                !isStarred[index]; // 누를 때마다 상태를 반전
                          });
                        },
                        child: Image.asset(
                          isStarred[index]
                              ? 'assets/fullstar.png' // 선택된 경우
                              : 'assets/emptystar.png', // 선택되지 않은 경우
                          width: 24, // 아이콘 크기
                          height: 24,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey, // 구분선 색상 설정
                      thickness: 1, // 구분선 두께 설정
                      indent: 16, // 좌측 들여쓰기 (title의 시작 위치와 맞춤)
                      endIndent: 16, // 우측 들여쓰기 (trailing의 끝 위치와 맞춤)
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
