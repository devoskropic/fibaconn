import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
