import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fibaconn/versions/v2/v2.1.0/providers/main_provider.dart';
import 'package:line_icons/line_icons.dart';

class FavWords extends StatelessWidget {
  const FavWords({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainProvider>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text("No favs yet."),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("You have ${appState.favorites.length} favorites."),
        ),
        for (var pair in appState.favorites)
          ListTile(
            title: Text(pair.asPascalCase),
            leading: Icon(LineIcons.heartAlt),
          ),
      ],
    );
  }
}
