//setMajor에서 string으로 된 학과 리스트를 받으면 
//Major(model) list 에 저장

import 'package:chaeyeon/data/major_data.dart';
import 'package:chaeyeon/models/major.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MajorNotifier extends StateNotifier<List<Major>>{

  MajorNotifier() : super([]);

  void setMajor(List<String> majorList){ 
    state = [];
    for (int i=0; i<majorList.length; i++){
      String majorFinding = majorList[i];
      for (final majorData in major){
        if (majorFinding == majorData.major){
          state.add(majorData);
        }
      }
    }
  }
}

final majorProvider = StateNotifierProvider<MajorNotifier, List<Major>> ((ref){
  return MajorNotifier();
}); 