import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fibaconn/providers/main_provider.dart';
// import 'package:fibaconn/screens/pub_imports.dart';
import 'package:fibaconn/widgets/drawer/drawer_item.dart';
import 'package:fibaconn/widgets/drawer/home_stateful_drawer.dart';
// import 'package:fibaconn/widgets/drawer/home_stateful_drawer_copy.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibaconn App',
      theme: AppTheme(),
      // home: HomeStatefulDrawerCopy(),
      home: HomeStatefulDrawer(
        selectedIndex: 0,
        drawerItem: DrawerItem("Home", Icons.home),
      ),
      // home: HomePage(title: 'Fibaconn', mobileScreen: 480),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData AppTheme() {
    return ThemeData(
      // primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        elevation: 5,
        color: Colors.deepPurpleAccent,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      drawerTheme: const DrawerThemeData(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
    );
  }
}
