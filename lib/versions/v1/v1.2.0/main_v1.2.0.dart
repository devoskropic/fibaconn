import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import 'package:line_icons/line_icons.dart';
import 'package:fibaconn/versions/v1/v1.2.0/big_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 0)),
            color: Colors.deepPurpleAccent,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        ),
        home: const MyHomePage(title: 'Fibaconn'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
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

  //NavigationRail index changed
  var selectedIndex = 0;
  void changeDestination(int value) {
    selectedIndex = value;
    print('selected: $value');
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Row(
        children: [
          SafeArea(
            child: NavyRail(appState: appState, theme: theme),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: WordGeneratorPage(),
            ),
          ),
        ],
      ),
    );
  }
}

class NavyRail extends StatelessWidget {
  const NavyRail({super.key, required this.appState, required this.theme});

  final MyAppState appState;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      // extended: false,
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: (Icon(Icons.home_filled)),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(LineIcons.heart),
          selectedIcon: (Icon(LineIcons.heartAlt)),
          label: Text('Favorites'),
        ),
      ],

      selectedIndex: appState.selectedIndex,
      onDestinationSelected: ((value) {
        appState.changeDestination(value);
      }),

      minWidth: 80,
      elevation: 8,
      useIndicator: true,
      indicatorColor: theme.highlightColor,
      backgroundColor: Colors.grey[200],
      selectedLabelTextStyle: TextStyle(color: Colors.lightBlue[600]),
      unselectedLabelTextStyle: TextStyle(color: Colors.grey[800]),
      selectedIconTheme: theme.iconTheme,
    );
  }
}

class WordGeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var icoText;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = LineIcons.heartAlt;
      icoText = "disike";
    } else {
      icon = LineIcons.heart;
      icoText = "like";
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavs();
                },
                icon: Icon(icon),
                label: Text(icoText),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
