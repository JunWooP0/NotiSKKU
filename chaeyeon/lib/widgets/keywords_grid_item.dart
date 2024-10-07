import 'package:chaeyeon/data/keyword_data.dart';
import 'package:chaeyeon/models/keyword.dart';
import 'package:flutter/material.dart';

class KeywordsGridItem extends StatelessWidget {
  const KeywordsGridItem({
    super.key,
    required this.keyword,
    required this.onSelectKeyword,
  });

  final Keyword keyword;
  final void Function() onSelectKeyword;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD9D9D9),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            '키워드',
            style: TextStyle(
              fontSize: 18,
              color:Color(0xFF979797),
            ),
          ),
        ),
      ),
    );
  }
}
