import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  //New word pair
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random(maxSyllables: 5);
    // print("got next! $current");
    notifyListeners();
  }

  //Word pair favorites
  var favorites = <WordPair>[];
  void toggleFavs() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  // Not used anymore:
  // NavigationRail index changed
  var selectedIndex = 0;
  void changeDestination(int value) {
    selectedIndex = value;
    print('selected: $value');
    notifyListeners();
  }
}
