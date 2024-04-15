import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:fibaconn/providers/main_provider.dart';
import 'package:fibaconn/versions/v2/v2.2.1/providers/main_provider.dart';
import 'package:fibaconn/versions/v2/v2.3.0/screens/home_page.dart';
// import 'package:fibaconn/versions/v2/v2.3.0/screens/sub_main.dart';

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
  final appTitle = "Fibapp";
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: AppTheme(),
      home: HomePage(title: appTitle, mobileScreen: 480),
      // home: SubMain(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData AppTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      appBarTheme: AppBarTheme(
        elevation: 3,
        color: Colors.teal.shade300,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
      ),
      drawerTheme: const DrawerThemeData(
        width: 300,
        // backgroundColor: Colors.white70, //kinda but not all transparent
      ),
      listTileTheme: ListTileThemeData(
        // selectedColor: Colors.teal.shade800,
        selectedTileColor: Colors.transparent,
      ),
    );
  }
}
