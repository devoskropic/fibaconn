import 'package:flutter/material.dart';
import 'package:fibaconn/presentation/themes/app_theme.dart';
import 'package:fibaconn/presentation/screens/imports.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appTitle = "Fibapp";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: AppTheme(),
      home: HomePage(title: appTitle, mobileScreen: 480),
      debugShowCheckedModeBanner: false,
    );
  }
}
