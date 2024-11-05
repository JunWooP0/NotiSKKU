import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/widgets/keywords_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditKeyword extends ConsumerStatefulWidget {
  const EditKeyword({Key? key}) : super(key: key);

  _EditKeywordState createState() => _EditKeywordState();
}

class _EditKeywordState extends ConsumerState<EditKeyword> {
  List<String> selectedKeywords = [];

  @override
  void initState() {
    super.initState();
    _loadKeywords();
  }

  Future<void> _loadKeywords() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedKeywords =
          prefs.getStringList('selectedKeywords') ?? ['Default Keyword'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeywordsGrid(
      selectedKeyword: selectedKeywords,
      onselectedKeywordChanged: (keywords) {
        setState(() {
          selectedKeywords = keywords; // 선택된 키워드 업데이트
        });
      },
    );
  }
}
