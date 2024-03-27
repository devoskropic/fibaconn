import 'package:flutter/material.dart';
import 'package:fibaconn/versions/v2/v2.2.1/widgets/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.mobileScreen});
  final String title;
  final int mobileScreen;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  Widget page = Placeholder();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    switch (selectedIndex) {
      case 0:
        page = WordGenerator();
        break;
      case 1:
        page = FavWords();
        break;
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }

    // v2.2.1 starts
    var colorScheme = theme.colorScheme;
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: page,
      ),
    );
    // v2.2.1 ends

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: constraints.maxWidth < widget.mobileScreen
              ? Column(
                  // Cellphone screen
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: mainArea),
                  ],
                )
              : Row(
                  // Big screens
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                    Expanded(child: mainArea),
                  ],
                ),
          bottomNavigationBar: constraints.maxWidth < widget.mobileScreen
              ? BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorites',
                    ),
                  ],
                  currentIndex: selectedIndex,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                )
              : null,
        );
      },
    );
  }
}
