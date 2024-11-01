import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notice {
  final String title;
  final String url;
  final String date;
  final String views;

  Notice({required this.title, required this.url, required this.date, required this.views});
}

Future<List<Notice>> fetchNotices(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var document = parser.parse(response.body);
    var noticeElements = document.querySelectorAll('dt.board-list-content-title a');
    var infoElements = document.querySelectorAll('dd.board-list-content-info ul');

    List<Notice> notices = [];
    for (int i = 0; i < noticeElements.length; i++) {
      var element = noticeElements[i];
      var infoElement = infoElements[i];

      String title = element.text.trim();
      String relativeUrl = element.attributes['href'] ?? '';
      String url = Uri.parse('https://www.skku.edu/skku/campus/skk_comm/notice01.do').resolve(relativeUrl).toString();

      var dateElement = infoElement.querySelectorAll('li')[2];
      String date = dateElement.text.trim();

      var viewsElement = infoElement.querySelectorAll('li')[3];
      String views = viewsElement.text.trim().replaceAll('조회수', '').trim();

      notices.add(Notice(title: title, url: url, date: date, views: views));
    }

    return notices;
  } else {
    throw Exception('Failed to load notices');
  }
}

class SecondPage extends ConsumerStatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends ConsumerState<SecondPage> {
  int selectedCategoryIndex = 0;
  List<String> categories = [];
  List<bool> isStarred = [];
  late Future<List<Notice>> noticesFuture;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadKeywords();
    noticesFuture = fetchNotices(_getCategoryUrl(0));
  }

  Future<void> _loadKeywords() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      categories = prefs.getStringList('selectedKeywords') ?? ['Default Keyword'];
    });
  }

  String _getCategoryUrl(int index) {
    return 'https://www.skku.edu/skku/campus/skk_comm/notice01.do';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/greenlogo.png', width: 40),
                    const Text(
                      '키워드',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 40,)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '키워드별 보기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEditing = !isEditing; // 편집 상태 전환
                      });

                    },
                    child: const Text(
                      '편집',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(categories.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                    noticesFuture = fetchNotices(_getCategoryUrl(index));
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 33, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: selectedCategoryIndex == index
                                        ? Color(0xB20B5B42)
                                        : Color(0x99D9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                      color: selectedCategoryIndex == index ? Colors.white : Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Notice>>(
              future: noticesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load notices'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No notices available'));
                } else {
                  final notices = snapshot.data!;
                  isStarred = List.generate(notices.length, (index) => false);

                  return ListView.builder(
                    itemCount: notices.length,
                    itemBuilder: (context, index) {
                      final notice = notices[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              notice.title,
                              style: TextStyle(fontSize: 17, color: Colors.black),
                            ),
                            subtitle: Text('${notice.date} | 조회수: ${notice.views}'),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isStarred[index] = !isStarred[index];
                                });
                              },
                              child: Image.asset(
                                isStarred[index] ? 'assets/images/fullstar.png' : 'assets/images/emptystar.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            onTap: () => _launchURL(notice.url),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
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
