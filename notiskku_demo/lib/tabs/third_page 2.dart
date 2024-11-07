import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/models/notice.dart';
import 'package:notiskku_demo/notice_functions/launch_url.dart';
import 'package:notiskku_demo/providers/starred_provider.dart';
import 'dart:convert';

class ThirdPage extends ConsumerStatefulWidget {
  const ThirdPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ThirdPageState();
  }
}

class _ThirdPageState extends ConsumerState<ThirdPage> {
  bool editMode = false;
  final LaunchUrlService launchUrlService = LaunchUrlService();

  @override
  Widget build(BuildContext context) {
    final starredNotices = ref.watch(starredProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/greenlogo.png', width: 40),
        ),
        title: const Text(
          '공지보관함',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  editMode = true;
                });
              },
              child: const Text(
                '편집',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: starredNotices.isEmpty
                  ? const Center(
                      child: Text(
                        '저장된 공지가 없습니다',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: starredNotices.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (BuildContext context, int index) {
                        final reversedIndex = starredNotices.length - 1 - index;
                        final starredNotice = starredNotices[reversedIndex];

                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                starredNotice.title, // 공지 제목 표시
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              onTap: () async {
                                await launchUrlService.launchURL(starredNotice.url);
                              },
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
