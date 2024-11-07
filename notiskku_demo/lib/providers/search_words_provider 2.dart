import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/services/preference_services.dart';

class SearchWordsNotifier extends StateNotifier<List<String>> {
  SearchWordsNotifier() : super([]) {
    _loadSearchWords();
  }

  Future<void> _loadSearchWords() async {
    List<String>? savedSearch = await getSavedSearch();
    if (savedSearch != null) {
      state = savedSearch;
    }
  }
  
  void searchWord(String word){
    if (state.contains(word)){ // 있으면 순서 바꿔서 최신으로 표시
      state = state.where((w) => w != word).toList();
      state = [...state, word];
    } else { // 없으면 추가
      state = [...state, word];
    }
    saveSearch(state);
  }

  void deleteWord(String word){
    state = state.where((w) => w != word).toList();
    saveSearch(state);
  }
}

final searchWordsProvider = StateNotifierProvider<SearchWordsNotifier, List<String>>( (ref) {
  return SearchWordsNotifier();
});