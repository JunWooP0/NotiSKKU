import 'package:flutter/material.dart';
import 'package:notiskku_demo/screens/start/logo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Async 초기화를 위해 필요합니다.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LogoPage(),
    );
  }
}
