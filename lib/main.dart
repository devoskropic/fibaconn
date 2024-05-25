import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fibaconn/presentation/my_app.dart';
import 'package:fibaconn/providers/main_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
