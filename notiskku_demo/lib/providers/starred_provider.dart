import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarredNotifier extends StateNotifier<List<String>>{ //manages list of strings

  // initialize - empty list
  StarredNotifier() : super([]);

  // adding URLs

  // deleting URLs

  // can be void function or bool function according to usage of widgets
  
}

final keywordProvider = StateNotifierProvider<StarredNotifier, List<String>> ((ref) {
  return StarredNotifier();
});