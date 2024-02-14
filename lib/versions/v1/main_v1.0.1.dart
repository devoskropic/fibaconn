import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';

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
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text('A random AWESOME idea:'),
            Card(
              color: theme.colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  pair.asPascalCase,
                  style: theme.textTheme.headlineSmall!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                  semanticsLabel: "${pair.first} ${pair.second}",
                ),
              ),
              elevation: 4,
            ),
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
      ),
    );
  }
}
