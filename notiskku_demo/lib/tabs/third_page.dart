import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/providers/starred_provider.dart';

class ThirdPage extends ConsumerStatefulWidget {
  const ThirdPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ThirdPageState();
  }
}

class _ThirdPageState extends ConsumerState<ThirdPage> {
  bool editMode = false;

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
                  'assets/images/greenlogo.png',
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
                      editMode = !editMode; // editMode 토글
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
                        final reversedIndex =
                            starredUrls.length - 1 - index;
                        final starredUrl = starredUrls[reversedIndex];

                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                starredUrl, // URL이 제대로 표시되도록
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              onTap: () {
                                // URL 열기 함수 또는 다른 액션 추가
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
