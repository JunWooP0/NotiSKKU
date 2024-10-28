import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/models/major.dart';

class MajorNotifier extends StateNotifier<List<String>>{ // manages list of strings - major list

  // initial value - empty list
  MajorNotifier() : super([]);

  // adding major
  // up to 2 constraints
  void addMajor(Major major){

  }

  // deleting major
  void deleteMajor(Major major){

  }
}

final majorProvider = StateNotifierProvider<MajorNotifier, List<String>> ((ref) {
  return MajorNotifier();
});