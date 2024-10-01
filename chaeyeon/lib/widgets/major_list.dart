import 'package:flutter/material.dart';
import 'package:chaeyeon/data/major_data.dart';
import 'package:chaeyeon/widgets/search_major.dart';

class MajorList extends StatefulWidget {
  const MajorList({
    super.key,
    required this.selectedMajor,
    required this.onSelectedMajorChanged,
  });

  final List<String> selectedMajor;
  final Function(List<String>) onSelectedMajorChanged;

  @override
  State<MajorList> createState() => _MajorListState();
}

class _MajorListState extends State<MajorList> {
  String searchText = ''; // 검색어 상태
  List<String> majors = major.map((major) => major.major).toList();

  @override
  Widget build(BuildContext context) {
    majors.sort((a, b) => a.compareTo(b));

    return Column(
      children: [
        // SearchMajor 위젯에서 onSearchChanged 콜백 전달
        SearchMajor(
          onSearchChanged: (newText) {
            setState(() {
              searchText = newText; // 검색어 상태 업데이트
            });
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: majors.length,
            itemBuilder: (BuildContext context, int index) {
              // 검색어가 있을 경우 필터링하여 표시
              if (searchText.isNotEmpty &&
                  !majors[index]
                      .toLowerCase()
                      .contains(searchText.toLowerCase())) {
                return const SizedBox.shrink(); // 검색어와 맞지 않으면 빈 위젯 반환
              }

              // 검색어가 없거나 조건에 맞는 학과를 표시
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.selectedMajor.contains(majors[index])) {
                      widget.selectedMajor.remove(majors[index]); // 선택 해제
                    } else if (widget.selectedMajor.length < 2) {
                      widget.selectedMajor.add(majors[index]); // 선택된 전공 저장
                    } else {
                      // 최대 2개 선택했을 때 알림 표시
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text(
                              '전공 선택 제한',
                              style: TextStyle(
                                color: Color(0xFF0B5B42),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("전공은 최대 두 개까지 선택할 수 있습니다."),
                                  const SizedBox(height: 10),
                                  Text(
                                    "선택한 전공: \n ${widget.selectedMajor.join('\n ')}",
                                  ),
                                ],
                              ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // 다이얼로그 닫기
                                },
                                child: const Text('확인',
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    widget.onSelectedMajorChanged(
                        widget.selectedMajor); // 선택된 전공 리스트 업데이트
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 1,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFD9D9D9),
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          majors[index],
                          style: TextStyle(
                            fontSize: 17.5,
                            fontWeight:
                                widget.selectedMajor.contains(majors[index])
                                    ? FontWeight.bold // 선택된 전공일 때 굵게
                                    : FontWeight.w400, // 일반 굵기
                            color: widget.selectedMajor.contains(majors[index])
                                ? const Color(0xFF0B5B42) // 선택된 전공일 때 초록색
                                : const Color(0xFF979797), // 일반 색상
                          ),
                        ),
                        if (widget.selectedMajor
                            .contains(majors[index])) // 체크 아이콘 추가
                          const Icon(Icons.check,
                              color: Color(0xFF0B5B42), size: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
