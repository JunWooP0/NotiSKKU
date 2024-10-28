import 'package:flutter/material.dart';
import 'package:notiskku_demo/data/major_data.dart';
import 'package:notiskku_demo/widgets/search_major.dart';

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
  String searchText = '';
  List<String> majors = major.map((major) => major.major).toList();

  @override
  Widget build(BuildContext context) {
    majors.sort((a, b) => a.compareTo(b));

    final screenWidth = MediaQuery.of(context).size.width;


    return Column(
      children: [
        SearchMajor(
          onSearchChanged: (newText) {
            setState(() {
              searchText = newText;
            });
          },
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: majors.length,
            itemBuilder: (BuildContext context, int index) {
              if (searchText.isNotEmpty &&
                  !majors[index]
                      .toLowerCase()
                      .contains(searchText.toLowerCase())) {
                return const SizedBox.shrink();
              }

              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.selectedMajor.contains(majors[index])) {
                      widget.selectedMajor.remove(majors[index]);
                    } else if (widget.selectedMajor.length < 2) {
                      widget.selectedMajor.add(majors[index]);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
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
                                  Navigator.of(context).pop();
                                },
                                child: const Text('확인',
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    widget.onSelectedMajorChanged(widget.selectedMajor);
                  });
                },
                // child: Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 35,
                //     vertical: 1,
                //   ),
                  
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.075), 
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
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                            color: widget.selectedMajor.contains(majors[index])
                                ? const Color(0xFF0B5B42)
                                : const Color(0xFF979797),
                          ),
                        ),
                        if (widget.selectedMajor.contains(majors[index]))
                          const Icon(Icons.check,
                              color: Color(0xFF0B5B42), size: 20),
                      ],
                    ),
                  ),
                // ),
              );
            },
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:notiskku_demo/data/major_data.dart';
// import 'package:notiskku_demo/widgets/search_major.dart';
// import 'package:notiskku_demo/models/major.dart'; // Major 모델을 가져옵니다.
// import 'package:notiskku_demo/providers/major_provider.dart'; // MajorProvider를 가져옵니다.

// class MajorList extends ConsumerWidget {
//   const MajorList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 선택된 전공 목록을 가져옵니다.
//     final selectedMajors = ref.watch(majorProvider.notifier);
//     final majorNotifier = ref.read(majorProvider.notifier);

//     String searchText = '';

//     return Column(
//       children: [
//         SearchMajor(
//           onSearchChanged: (newText) {
//             searchText = newText; // searchText 상태를 업데이트합니다.
//           },
//         ),
//         const SizedBox(height: 10,),
//         Expanded(
//           child: ListView.builder(
//             itemCount: major.length,
//             itemBuilder: (BuildContext context, int index) {
//               if (searchText.isNotEmpty &&
//                   !major[index].major.toLowerCase().contains(searchText.toLowerCase())) {
//                 return const SizedBox.shrink();
//               }

//               return GestureDetector(
//                 onTap: () {
//                   try {
//                     majorNotifier.selectMajor(major[index]);
//                   } catch (e) {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           backgroundColor: Colors.white,
//                           title: const Text(
//                             '전공 선택 제한',
//                             style: TextStyle(
//                               color: Color(0xFF0B5B42),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           content: const Text("전공은 최대 두 개까지 선택할 수 있습니다."),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('확인', style: TextStyle(color: Colors.black)),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   }
//                 },
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.075), 
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 15,
//                   ),
//                   decoration: const BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Color(0xFFD9D9D9),
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         major[index].major,
//                         style: TextStyle(
//                           fontSize: 17.5,
//                           fontWeight: selectedMajors.contains(major[index].major)
//                               ? FontWeight.bold
//                               : FontWeight.w400,
//                           color: selectedMajors.contains(major[index].major)
//                               ? const Color(0xFF0B5B42)
//                               : const Color(0xFF979797),
//                         ),
//                       ),
//                       if (selectedMajors.contains(major[index].major))
//                         const Icon(Icons.check,
//                             color: Color(0xFF0B5B42), size: 20),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
