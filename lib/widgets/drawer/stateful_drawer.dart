import 'package:flutter/material.dart';
import 'package:fibaconn/widgets/drawer/drawer_item.dart';
import 'package:fibaconn/widgets/drawer/menu_options.dart';
// import 'package:fibaconn/widgets/drawer/first_screen.dart';
import 'package:fibaconn/widgets/drawer/home_stateful_drawer.dart';

class StatefulDrawer extends StatefulWidget {
  StatefulDrawer({super.key, required this.selectedIndex, required this.drawerItems});

  final int selectedIndex;
  final List<DrawerItem> drawerItems;

  @override
  State<StatefulDrawer> createState() => _StatefulDrawerState();
}

class _StatefulDrawerState extends State<StatefulDrawer> {
  // getDrawerItemScreen(int index) {
  //   return FirstScreen(drawerItem: widget.drawerItems[index]);
  // }

  onSelectItem(int index) {
    // setState(() {
    //   // widget.selectedIndex = index;
    //   Navigator.of(context).pop(); // close the drawer
    // });

    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => HomeStatefulDrawer(
    //       selectedIndex: index, // widget.selectedIndex,
    //       drawerItem: widget.drawerItems[index],
    //     ),
    //   ),
    // );

    Navigator.of(context).pop(); // close the drawer

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeStatefulDrawer(
          selectedIndex: index, // widget.selectedIndex,
          drawerItem: widget.drawerItems[index],
        ),
        // builder: (context) => getDrawerItemScreen(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var drawerOptions = []; // Original (old flutter version)
    List<Widget> drawerOptions = [];

    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        MenuOption(
          title: d.title,
          onTap: () => onSelectItem(i),
          leading: Icon(d.icon),
          selected: i == widget.selectedIndex,
        ),
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildHeader(context),
          buildMenuItems(context, drawerOptions),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        "Mister Coder",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
      accountEmail: Text(
        "generic@gmail.com",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/grey.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context, List<Widget> drawerOptions) {
    return Column(
      children: [
        for (Widget item in drawerOptions) item,
      ],
    );
  }
}
