import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarredNotifier extends StateNotifier<List<String>>{

  StarredNotifier() : super([]);

  //크롤링 데이터 models에 등록
  //필요할 시 data 디렉토리에 빈 리스트 더미로 생성
  //즐겨찾기 추가, 삭제 등 수행

}

final starredProvider = StateNotifierProvider<StarredNotifier, List<String>> ((ref){
  return StarredNotifier();
}); 