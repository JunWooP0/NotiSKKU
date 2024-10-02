import 'package:chaeyeon/data/keyword_data.dart';
import 'package:chaeyeon/models/keyword.dart';
import 'package:chaeyeon/widgets/keywords_grid_item.dart';
import 'package:flutter/material.dart';

class KeywordsGrid extends StatefulWidget{
  const KeywordsGrid({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KeywordsGridState();
  }
}

class _KeywordsGridState extends State<KeywordsGrid>{

  void _selectKeyword (BuildContext context, Keyword keyword) {
   
  }


  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 40,),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final keyword in keywords)
          KeywordsGridItem(
            keyword: keyword,
            onSelectKeyword: (){
              _selectKeyword(context, keyword);
            } ,
          )
      ],
    );
  }
}