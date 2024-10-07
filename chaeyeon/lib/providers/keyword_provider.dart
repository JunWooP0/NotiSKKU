import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeywordNotifier extends StateNotifier<List<String>>{

  KeywordNotifier() : super([]);

  void setKeyword(List<String> keywordList){
    state = keywordList;
  }

  void addKeyword(String keyword) {
    if (!state.contains(keyword)) {
      state = [...state, keyword]; 
    }
  }

  void removeKeyword(String keyword) {
    state = state.where((k) => k != keyword).toList();
  }

  void clearKeywords() {
    state = [];
  }
}

final keywordProvider = StateNotifierProvider<KeywordNotifier, List<String>> ((ref){
  return KeywordNotifier();
});