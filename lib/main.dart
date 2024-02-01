import 'package:fibaconn/widgets/imports.dart';
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
          // primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 0)),
            color: Colors.deepPurpleAccent,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
            // elevation: 5,
          ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        ),
        home: const MyHomePage(title: 'Demo app'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random(maxSyllables: 5);
    // print("got next! $current");
    notifyListeners();
  }

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
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    IconData icon;
    var icoText;
    if (appState.favorites.contains(pair)) {
      icon = LineIcons.heartAlt;
      icoText = "disike";
    } else {
      icon = icon = LineIcons.heart;
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
            BigCard(pair: pair),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // IconButton(
                //   onPressed: () {
                //     appState.toggleFavs();
                //   },
                //   icon: Icon(icon),
                // ),
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
