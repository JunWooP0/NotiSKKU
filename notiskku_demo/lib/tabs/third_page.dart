import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/models/notice.dart';
import 'package:notiskku_demo/notice_functions/fetch_notice.dart';
import 'package:notiskku_demo/providers/starred_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPage extends ConsumerStatefulWidget {
  const ThirdPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ThirdPageState();
  }
}

class _ThirdPageState extends ConsumerState<ThirdPage> {
  bool editMode = false;
  late Future<List<Notice>> noticesFuture;
  final noticeService = NoticeService(); // NoticeService 인스턴스 생성

  @override
  void initState() {
    super.initState();
    noticesFuture = noticeService
        .fetchNotices('https://www.skku.edu/skku/campus/skk_comm/notice01.do');
  }

  @override
  Widget build(BuildContext context) {
    final starredUrls = ref.watch(starredProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Padding을 Container로 이동
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  // 'assets/images/greenlogo.png',
                  'assets/images/greenlogo_fix.png',
                  width: 40,
                ),
                const Text(
                  '공지보관함',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
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
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: starredUrls.isEmpty
                  ? const Center(
                      child: Text(
                        '저장된 공지가 없습니다',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: starredUrls.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (BuildContext context, int index) {
                        final reversedIndex = starredUrls.length - 1 - index;
                        final starredUrl = starredUrls[reversedIndex];

                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                starredUrl, // URL말고 공지 제목 나오게 바꿔야됨
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              onTap: () {
                                // URL 열기 함수 호출
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

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
