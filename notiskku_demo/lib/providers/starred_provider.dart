import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/services/preference_services.dart';

class StarredNotifier extends StateNotifier<List<String>> {
  //manages list of strings

  // initialize - empty list
  StarredNotifier() : super([]) {
    _loadStarredUrl();
  }

  Future<void> _loadStarredUrl() async {
    List<String>? savedUrl = await getSavedUrl();
    if (savedUrl != null) {
      state = savedUrl;
    }
  }

  // toggle starred URLs
  void toggleUrl(String url) {
    if (state.contains(url)) {
      state = state.where((u) => u != url).toList();
    } else {
      state = [...state, url];
    }
    saveUrl(state);
  }
}

final starredProvider =
    StateNotifierProvider<StarredNotifier, List<String>>((ref) {
  return StarredNotifier();
});
