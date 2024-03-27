import 'package:flutter/material.dart';
import 'package:fibaconn/widgets/drawer/drawer_item.dart';
import 'package:fibaconn/widgets/drawer/stateful_drawer.dart';
// import 'package:fibaconn/widgets/drawer/menu_options.dart';

class HomeStatefulDrawer extends StatelessWidget {
  HomeStatefulDrawer({super.key, required this.selectedIndex, required this.drawerItem});

  final int selectedIndex;
  final DrawerItem drawerItem;

  final drawerItems = [
    DrawerItem("Home", Icons.home),
    DrawerItem("Aeroplane", Icons.local_airport),
    DrawerItem("Pizza", Icons.local_pizza),
    DrawerItem("Coffee", Icons.local_cafe)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drawerItem.title),
      ),
      drawer: StatefulDrawer(
        selectedIndex: selectedIndex,
        drawerItems: drawerItems,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MediaQuery.of(context).size.width < 480
                ? Icon(drawerItem.icon, size: 46.0)
                : Icon(drawerItem.icon, size: 60.0),
            Text(
              drawerItem.title,
              style: MediaQuery.of(context).size.width < 480
                  ? TextStyle(fontSize: 32.0, fontWeight: FontWeight.w300)
                  : TextStyle(fontSize: 48.0, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
