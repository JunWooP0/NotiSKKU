import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/tabs/second_page.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/images/go_back.png', width: 40),
          ),
        ),
        title: const Text(
          '키워드',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // 제목 중앙 정렬
        actions: const [
          SizedBox(width: 40), // 오른쪽 여백 추가
        ],
      ),
      backgroundColor: Colors.white,
      body: Text('키워드 편집'),
    );
  }
}
