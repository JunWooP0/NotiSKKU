import 'package:flutter/material.dart';
import 'package:notiskku_demo/data/keyword_data.dart';
import 'package:notiskku_demo/models/keyword.dart';
import 'package:notiskku_demo/services/preference_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmKeywordsGrid extends StatefulWidget {
  const AlarmKeywordsGrid({
    super.key,
    required this.alarmKeyword,
    required this.onAlarmKeywordChanged,
  });

  final List<String> alarmKeyword;
  final Function(List<String>) onAlarmKeywordChanged;

  @override
  State<StatefulWidget> createState() {
    return _AlarmKeywordsGridState();
  }
}

class _AlarmKeywordsGridState extends State<AlarmKeywordsGrid> {
  List<String> alarmKeywords = []; // List for keywords to receive alarms
  List<Keyword> filteredKeywords = [];

  @override
  void initState() {
    super.initState();
    loadAlarmKeywords();
    _loadKeywords();
  }

  Future<void> _loadKeywords() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the list of selected keywords from SharedPreferences.
    final keywordStrings =
        prefs.getStringList('selectedKeywords') ?? ['Default Keyword'];

    setState(() {
      // Map each string in keywordStrings to a Keyword object
      filteredKeywords = keywordStrings
          .map((k) => Keyword(
                keyword: k,
                defined: _getDefinedValue(
                    k), // Assigning Defined enum based on the keyword
              ))
          .toList();
    });
  }

  // Function to map a keyword to its corresponding Defined enum value
  Defined _getDefinedValue(String keyword) {
    // Here, you can implement your logic for mapping
    // For demonstration, we'll map 'user' keywords to Defined.user, 'dev' to Defined.developer
    if (keyword.contains('user')) {
      return Defined.user;
    } else if (keyword.contains('developer')) {
      return Defined.developer;
    } else {
      return Defined.user; // Default fallback
    }
  }

  // Method to load saved alarm keywords
  Future<void> loadAlarmKeywords() async {
    List<String>? loadedAlarmKeywords = await getAlarmKeywords();
    if (loadedAlarmKeywords != null) {
      setState(() {
        alarmKeywords = loadedAlarmKeywords;
        widget.onAlarmKeywordChanged(alarmKeywords);
      });
    }
  }

  // Method to save selected alarm keywords to preferences
  Future<void> saveAlarmKeywordsToPrefs() async {
    await saveAlarmKeywords(alarmKeywords);
  }

  // Toggle alarm selection for keywords
  void _toggleAlarmKeyword(BuildContext context, Keyword keyword) {
    setState(() {
      if (alarmKeywords.contains(keyword.keyword)) {
        alarmKeywords.remove(keyword.keyword); // Remove from alarm list
      } else {
        alarmKeywords.add(keyword.keyword); // Add to alarm list if selected
      }

      widget.onAlarmKeywordChanged(alarmKeywords);
      saveAlarmKeywordsToPrefs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = (screenWidth - 80) / 3;
    final buttonHeight = buttonWidth * (37 / 86);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (buttonWidth / buttonHeight),
                crossAxisSpacing: 19,
                mainAxisSpacing: 30,
              ),
              itemCount: filteredKeywords.length,
              itemBuilder: (context, index) {
                final keywordObj = filteredKeywords[index];
                if (keywordObj.keyword == '없음') {
                  return SizedBox.shrink(); // 아무것도 출력하지 않음
                }
                bool isAlarmSelected =
                    alarmKeywords.contains(keywordObj.keyword);
                return GestureDetector(
                  onTap: () => _toggleAlarmKeyword(context, keywordObj),
                  child: Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isAlarmSelected
                          ? const Color(0xB20B5B42)
                          : const Color(0x99D9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        keywordObj.keyword,
                        style: TextStyle(
                          fontSize: buttonWidth * 0.16,
                          color: isAlarmSelected
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF979797),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
