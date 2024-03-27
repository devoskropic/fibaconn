import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fibaconn/versions/v2/v2.2.1/providers/main_provider.dart';
import 'package:fibaconn/versions/v2/v2.2.2/home_page.dart';
// import 'package:fibaconn/widgets/drawer/home_stateful_drawer.dart';

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
      home: HomePage(title: 'Fibaconn', mobileScreen: 480),
      // home: HomeStatefulDrawer(),
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
