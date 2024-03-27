import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
        title: 'Fibaconn App',
        theme: AppTheme(),
        home: const MyHomePage(title: 'Fibaconn'),
      ),
    );
  }

  ThemeData AppTheme() {
    return ThemeData(
      // primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 0)),
        color: Colors.deepPurpleAccent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        elevation: 5,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  var mobScreen = 280;
  Widget page = Placeholder();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    switch (selectedIndex) {
      case 0:
        page = WordGeneratorPage();
        break;
      case 1:
        page = FavsPage();
        break;
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          // backgroundColor: theme.colorScheme.primary,
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (MediaQuery.of(context).size.width >= mobScreen)
              SafeArea(
                child: NavyRail(
                  selectedIndex: selectedIndex,
                  theme: theme,
                  constraints: constraints,
                  onDestinationSelected: (int) {
                    setState(() {
                      selectedIndex = int;
                    });
                  },
                ),
              ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
        bottomNavigationBar: constraints.maxWidth < mobScreen
            ? GNav(
                tabs: [
                  GButton(icon: LineIcons.home),
                  GButton(icon: LineIcons.user),
                  GButton(icon: LineIcons.heart),
                  GButton(icon: LineIcons.genderless),
                  GButton(icon: LineIcons.doorOpen),
                ],
              )
            : null,
      );
    });
  }
}

// TO DO: Extract to external files at new version
class NavyRail extends StatelessWidget {
  const NavyRail({
    super.key,
    required this.selectedIndex,
    required this.theme,
    required this.constraints,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ThemeData theme;
  final BoxConstraints constraints;
  final Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: constraints.maxWidth >= 640,
      selectedIndex: selectedIndex,
      // onDestinationSelected: ((value) {
      //   setState(() {
      //     selectedIndex = value;
      //   });
      // }),
      onDestinationSelected: onDestinationSelected,
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
      minWidth: 80,
      elevation: 4,
      useIndicator: true,
      indicatorColor: theme.highlightColor,
      backgroundColor: Colors.grey[200],
      selectedLabelTextStyle: TextStyle(color: Colors.lightBlue[600]),
      unselectedLabelTextStyle: TextStyle(color: Colors.grey[800]),
      selectedIconTheme: theme.iconTheme,
    );
  }
}

class FavsPage extends StatelessWidget {
  const FavsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text("No favs yet."),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("You have ${appState.favorites.length} favorites."),
        ),
        for (var pair in appState.favorites)
          ListTile(
            title: Text(pair.asPascalCase),
            leading: Icon(LineIcons.heartAlt),
          ),
      ],
    );
  }
}

class WordGeneratorPage extends StatelessWidget {
  const WordGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var icoText;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = LineIcons.heartAlt;
      icoText = "dislike";
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

  //Not used anymore
  //NavigationRail index changed
  var selectedIndex = 0;
  void changeDestination(int value) {
    selectedIndex = value;
    print('selected: $value');
    notifyListeners();
  }
}
