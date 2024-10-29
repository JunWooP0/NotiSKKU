import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/models/major.dart';

class MajorNotifier extends StateNotifier<List<String>>{ // manages list of strings - major list

  // initial value - empty list
  MajorNotifier() : super([]);

  // selecting major
  void selectMajor(Major major){
    state = [...state];
    if (state.contains(major.major)){
      state = state.where( (m) => m != major.major).toList();
      return;
    } else if (state.length < 2){
      state = [...state, major.major];
      return;
    } else {
      throw Exception('Maximum number of majors reached');
    }
  }

}

final majorProvider = StateNotifierProvider<MajorNotifier, List<String>> ((ref) {
  return MajorNotifier();
});