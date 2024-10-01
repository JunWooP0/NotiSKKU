// import 'package:flutter/material.dart';
// import 'package:chaeyeon/models/majors.dart';

// class SelectDepartment extends StatefulWidget {
//   const SelectDepartment({super.key});

//   @override
//   State<SelectDepartment> createState() {
//     return _SelectDepartmentState();
//   }
// }

// class _SelectDepartmentState extends State<SelectDepartment> {
//   int _selectedIndex = 0;
//   final TextEditingController _titleController = TextEditingController();
//   String searchText = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           const SizedBox(height: 60),
//           const Align(
//             alignment: Alignment(-0.4, 0),
//             child: Text(
//               '관심 학과와 키워드를 선택해주세요😀\n(학과는 최대 2개까지 가능)',
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14.3,
//                 fontFamily: 'GmarketSans',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           const SizedBox(height: 2),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _buildButton(0, "학과"),
//               const SizedBox(width: 20),
//               _buildButton(1, "키워드"),
//             ],
//           ),
//           const SizedBox(height: 13),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 35),
//             child: OutlinedButton(
//               onPressed: () {},
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(
//                   color: Color(0xFF0B5B42),
//                   width: 2.5,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _titleController,
//                         maxLength: 50,
//                         decoration: const InputDecoration(
//                           hintText: '검색어를 입력하세요.',
//                           hintStyle: TextStyle(
//                             fontSize: 18,
//                             color: Color(0xFFD9D9D9),
//                           ),
//                           counterText: '', // 최대 입력 길이 표시 숨기기
//                           border: InputBorder.none, // 밑줄 스타일 제거
//                           focusedBorder: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             searchText = value;
//                           });
//                         },
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.search,
//                         size: 37,
//                         color: Color(0xFF0B5B42),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               // items 변수에 저장되어 있는 모든 값 출력
//               itemCount: majors.length,
//               itemBuilder: (BuildContext context, int index) {
//                 // 검색 기능, 검색어가 있을 경우
//                 if (searchText.isNotEmpty &&
//                     !majors[index]
//                         .toLowerCase()
//                         .contains(searchText.toLowerCase())) {
//                   return const SizedBox.shrink(); // 조건에 맞지 않으면 빈 위젯 반환
//                 }

//                 // 검색어가 없을 경우, 모든 항목 표시
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 35,
//                     vertical: 1,
//                   ),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 15,
//                     ),
//                     decoration: const BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           color:Color(0xFFD9D9D9),
//                           width: 2,
//                         ),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           majors[index],
//                           style: const TextStyle(
//                             fontSize: 17.5,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xFF979797),
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xff0b5b42),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 140, vertical: 18),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: const Text(
//                 '다음으로',
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton(int index, String text) {
//     bool isSelected = _selectedIndex == index;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Container(
//         width: 150,
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: isSelected
//                   ? const Color(0xFF0B5B42)
//                   : const Color(0xFF979797),
//               width: 2.3,
//             ),
//           ),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
//               color: isSelected
//                   ? const Color(0xFF0B5B42)
//                   : const Color(0xFF979797),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }