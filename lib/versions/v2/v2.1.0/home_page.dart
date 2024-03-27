import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:fibaconn/versions/v2/v2.1.0/widgets/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.mobileScreen});
  final String title;
  final int mobileScreen;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  // var mobScreen = 280;
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

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          // backgroundColor: theme.colorScheme.primary,
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (MediaQuery.of(context).size.width >= widget.mobileScreen)
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
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
        bottomNavigationBar: constraints.maxWidth < widget.mobileScreen
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
