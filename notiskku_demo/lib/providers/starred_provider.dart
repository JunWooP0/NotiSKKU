import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/models/notice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StarredNotifier extends StateNotifier<List<Notice>> {
  StarredNotifier() : super([]) {
    _loadStarredNotices();
  }

  Future<void> _loadStarredNotices() async {
    final prefs = await SharedPreferences.getInstance();
    final savedNotices = prefs.getStringList('starred_notices');
    if (savedNotices != null) {
      state = savedNotices
          .map((noticeJson) => Notice.fromJson(json.decode(noticeJson)))
          .toList();
    }
  }

  void toggleNotice(Notice notice) async {
    if (state.any((n) => n.url == notice.url)) {
      state = state.where((n) => n.url != notice.url).toList();
    } else {
      state = [...state, notice];
    }
    await _saveStarredNotices();
  }

  Future<void> _saveStarredNotices() async {
    final prefs = await SharedPreferences.getInstance();
    final noticesJsonList =
        state.map((notice) => json.encode(notice.toJson())).toList();
    await prefs.setStringList('starred_notices', noticesJsonList);
  }

  bool contains(String url) {
    return state.any((notice) => notice.url == url);
  }
}

final starredProvider = StateNotifierProvider<StarredNotifier, List<Notice>>((ref) {
  return StarredNotifier();
});
