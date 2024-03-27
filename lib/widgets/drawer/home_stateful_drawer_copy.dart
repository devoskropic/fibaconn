import 'package:flutter/material.dart';
import 'package:fibaconn/widgets/drawer/drawer_item.dart';
// import 'package:fibaconn/widgets/drawer/drawerg.dart';
// import 'package:fibaconn/widgets/drawer/menu_options.dart';
import 'package:fibaconn/widgets/drawer/first_screen.dart';

class HomeStatefulDrawerCopy extends StatefulWidget {
  const HomeStatefulDrawerCopy({super.key});

  @override
  State<HomeStatefulDrawerCopy> createState() => _HomeStatefulDrawerCopyState();
}

class _HomeStatefulDrawerCopyState extends State<HomeStatefulDrawerCopy> {
  int selectedIndex = 0;

  final drawerItems = [
    DrawerItem("Aeroplane", Icons.local_airport),
    DrawerItem("Pizza", Icons.local_pizza),
    DrawerItem("Coffee", Icons.local_cafe)
  ];

  getDrawerItemScreen(int pos) {
    // return FirstScreen(drawerItem: drawerItems[selectedIndex]);
    return FirstScreen(drawerItem: drawerItems[pos]);
  }

  onSelectItem(int index) {
    setState(() {
      selectedIndex = index;
      getDrawerItemScreen(selectedIndex);
    });

    Navigator.of(context).pop(); // close the drawer
    /* Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _getDrawerItemScreen(_selectedIndex),
      ),
    ); */
  }

  @override
  Widget build(BuildContext context) {
    // // var drawerOptions = []; // Original (old flutter version)
    List<Widget> drawerOptions = [];

    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
        ListTile(
          title: Text(
            d.title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
          ),
          leading: Icon(d.icon),
          selected: i == selectedIndex,
          onTap: () => onSelectItem(i),
          // onTap: () {
          //   setState(() {
          //     selectedIndex = i;
          //     // getDrawerItemScreen(selectedIndex);
          //     FirstScreen(drawerItem: drawerItems[i]);
          //   });

          //   Navigator.of(context).pop();
          // },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),
      // drawer: Drawerg(),
      // body: FirstScreen(drawerItem: drawerItems[pos]),
    );
  }

  Widget buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        "Yuvraj Pandey",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
      accountEmail: Text(
        "yuvrajn.pandey@gmail.com",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
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
