import 'package:chaeyeon/testMainhome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '공지사항 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoticesPage()
    );
  }
}


