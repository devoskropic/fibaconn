import 'package:flutter/material.dart';
import 'package:fibaconn/screens/home_page.dart';
import 'package:fibaconn/widgets/drawer/menu_options.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

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
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(
                  title: "Home",
                  mobileScreen: 550,
                ),
              ),
            );
          },
          selected: true,
        ),
        ListTile(
          title: const Text('Favorites'),
          leading: const Icon(Icons.favorite),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(
                  title: "Favorites",
                  mobileScreen: 550,
                ),
              ),
            );
          },
          selected: false,
        ),
      ],
    );
  }
}
