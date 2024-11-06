import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NoticesPage extends StatefulWidget {
  
  @override
  _NoticesPageState createState() => _NoticesPageState();
}

class _NoticesPageState extends State<NoticesPage> {
  List<dynamic> notices = [];

  @override
  void initState() {
    super.initState();
    fetchNotices();
    print("init");
  }

  Future<void> fetchNotices() async {
  final response = await http.get(Uri.parse('http://localhost:8000/api/notices/'));

  if (response.statusCode == 200) {
    var decodedData = json.decode(response.body);
    
    // 'notices' 키에서 배열을 가져와 notices 리스트에 할당
    setState(() {
      notices = List.from(decodedData['notices']);
    });

    print("notice fetched");
  } else {
    print('Failed to load notices');
  }
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('공지사항'),
      ),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notices[index]['title']),
            subtitle: Text(
                '날짜: ${notices[index]['date']} | 조회수: ${notices[index]['views']}'),
            onTap: () {
              // URL을 누르면 링크로 이동하는 기능 구현
            },
          );
        },
      ),
    );
  }
}
