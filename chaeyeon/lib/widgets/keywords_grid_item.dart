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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text('keyword'),
      ),
    );
  }
}
