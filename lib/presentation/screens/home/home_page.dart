import 'package:flutter/material.dart';
import 'package:fibaconn/presentation/widgets/imports.dart';
import 'package:fibaconn/presentation/screens/home/widgets/app_drawer.dart';
import 'package:fibaconn/presentation/screens/home/widgets/navy_rail.dart';

class HomePage extends StatefulWidget {
  final String title;
  final int mobileScreen;

  const HomePage({super.key, required this.title, required this.mobileScreen});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  Widget _widgetView = Placeholder();

  _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    switch (_selectedIndex) {
      case 0:
        _widgetView = WordGenerator();
        break;
      case 1:
        _widgetView = FavWords();
        break;
      default:
        throw UnimplementedError("No widget for $_selectedIndex");
    }

    // v2.2.1 starts
    var colorScheme = theme.colorScheme;

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _widgetView,
      ),
    );
    // v2.2.1 ends

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: AppBar(title: Text(widget.title)),
          drawer: AppDrawer(
            selectedIndex: _selectedIndex,
            onTap: _onItemSelected,
          ),
          body: constraints.maxWidth < widget.mobileScreen
              ? Column(
                  // Cellphone screen
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Expanded(child: mainArea)],
                )
              : Row(
                  // Big screens
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SafeArea(
                      child: NavyRail(
                        selectedIndex: _selectedIndex,
                        theme: theme,
                        constraints: constraints,
                        onDestinationSelected: _onItemSelected,
                        // (int) {
                        //   setState(() {
                        //     _selectedIndex = int;
                        //   });
                        // },
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
                  currentIndex: _selectedIndex,
                  onTap: _onItemSelected,
                  // (value) {
                  //   setState(() {
                  //     _selectedIndex = value;
                  //   });
                  // },
                )
              : null,
        );
      },
    );
  }
}
