import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/models/keyword.dart';

class KeywordNotifier extends StateNotifier<List<String>>{ //manages list of strings

  // initialize - empty list
  KeywordNotifier() : super([]);

  // adding keyword
  void addKeyword(Keyword keyword){

  }

  // deleting keyword
  void deleteKeyword(Keyword keyword){

  }
}

final keywordProvider = StateNotifierProvider<KeywordNotifier, List<String>> ((ref) {
  return KeywordNotifier();
});