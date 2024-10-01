import 'package:flutter/material.dart';

class KeywordsGrid extends StatefulWidget{
  const KeywordsGrid({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KeywordsGridState();
  }
}

class _KeywordsGridState extends State<KeywordsGrid>{
  @override
  Widget build(BuildContext context) {
    return const Text('그리드 형태 키워드 제공');
  }
}