import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fibaconn/providers/v2.2.0/main_provider.dart';
import 'package:fibaconn/screens/public/v2.2.0/pub_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: MaterialApp(
        title: 'Fibaconn App',
        theme: AppTheme(),
        home: HomePage(title: 'Fibaconn', mobileScreen: 280),
      ),
    );
  }

  ThemeData AppTheme() {
    return ThemeData(
      // primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 0)),
        color: Colors.deepPurpleAccent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        elevation: 5,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
    );
  }
}
