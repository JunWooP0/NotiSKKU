import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/models/keyword.dart';
import 'package:notiskku_demo/services/preference_services.dart';

class KeywordNotifier extends StateNotifier<List<String>> {
  KeywordNotifier() : super([]) {
    _loadKeywords(); // 초기화 시 저장된 키워드 목록을 불러옵니다.
  }

  // 키워드 목록 로드
  Future<void> _loadKeywords() async {
    List<String>? savedKeywords = await getSelectedKeywords();
    if (savedKeywords != null) {
      state = savedKeywords;
    }
  }

  // 키워드 추가
  void addKeyword(Keyword keyword) {
    if (!state.contains(keyword.keyword)) {
      state = [...state, keyword.keyword];
      saveSelectedKeywords(state); // 추가 후 저장
    }
  }

  // 키워드 삭제
  void deleteKeyword(Keyword keyword) {
    state = state.where((k) => k != keyword.keyword).toList();
    saveSelectedKeywords(state); // 삭제 후 저장
  }
}

final keywordProvider = StateNotifierProvider<KeywordNotifier, List<String>>((ref) {
  return KeywordNotifier();
});
