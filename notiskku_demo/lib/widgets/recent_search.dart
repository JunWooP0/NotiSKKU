import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notiskku_demo/providers/search_words_provider.dart';

class RecentSearch extends ConsumerStatefulWidget {
  const RecentSearch({super.key});

  @override
  _RecentSearchState createState() => _RecentSearchState();
}

class _RecentSearchState extends ConsumerState<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    final searchedWords = ref.watch(searchWordsProvider);
  
    return Expanded(
      child: ListView.builder(
        itemCount: searchedWords.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (BuildContext context, int index) {
          final reversedIndex = searchedWords.length - 1 - index;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0x99D9D9D9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  searchedWords[reversedIndex],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(searchWordsProvider.notifier).deleteWord(searchedWords[reversedIndex]);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
