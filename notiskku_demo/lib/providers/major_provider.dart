import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/models/major.dart';
import 'package:notiskku_demo/services/preference_services.dart';

class MajorNotifier extends StateNotifier<List<String>> {
  MajorNotifier() : super([]) {
    _loadMajors(); // 초기화 시 저장된 전공 목록을 불러옵니다.
  }

  // 전공 목록 로드
  Future<void> _loadMajors() async {
    List<String>? savedMajors = await getSelectedMajors();
    if (savedMajors != null) {
      state = savedMajors;
    }
  }

  // 전공 선택 시 저장된 전공 목록 업데이트
  void selectMajor(Major major) {
    if (state.contains(major.major)) {
      state = state.where((m) => m != major.major).toList();
    } else if (state.length < 2) {
      state = [...state, major.major];
    } else {
      throw Exception('Maximum number of majors reached');
    }
    saveSelectedMajors(state); // 변경된 state를 저장
  }
}

final majorProvider = StateNotifierProvider<MajorNotifier, List<String>>((ref) {
  return MajorNotifier();
});
