import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MainProvider extends ChangeNotifier {
  //New word pair
  var current = WordPair.random();

  void getNext() {
    // v2.2.1 starts
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    // v2.2.1 ends
    current = WordPair.random(maxSyllables: 5);
    notifyListeners();
  }

  //Word pair favorites
  var favorites = <WordPair>[];
  // void toggleFavs() {
  //   if (favorites.contains(current)) {
  //     favorites.remove(current);
  //   } else {
  //     favorites.add(current);
  //   }
  //   notifyListeners();
  // }

  // v2.2.1 starts
  void toggleFavs([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  var history = <WordPair>[];
  GlobalKey? historyListKey;

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
  // v2.2.1 ends

  // Not used anymore:
  // NavigationRail index changed
  var selectedIndex = 0;
  void changeDestination(int value) {
    selectedIndex = value;
    print('selected: $value');
    notifyListeners();
  }
}
