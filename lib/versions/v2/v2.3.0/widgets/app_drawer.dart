import 'package:flutter/material.dart';
import 'package:fibaconn/widgets/menu_options.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  AppDrawer({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MainProvider>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return const DrawerHeader(
      child: Stack(
        children: [
          Positioned(
            bottom: 8.0,
            left: 4.0,
            child: Text(
              "Fibaconn",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/grey.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        MenuOption(
          title: "Home",
          leading: Icon(Icons.home),
          onTap: () {
            onTap(0);
            Navigator.pop(context);
          },
          selected: selectedIndex == 0,
        ),
        ListTile(
          title: const Text('Favorites'),
          leading: const Icon(Icons.favorite),
          onTap: () {
            onTap(1);
            Navigator.pop(context);
          },
          selected: selectedIndex == 1,
        ),
      ],
    );
  }
}
