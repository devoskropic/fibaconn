import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fibaconn/providers/main_provider.dart';
import 'package:line_icons/line_icons.dart';

class FavWords extends StatelessWidget {
  const FavWords({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MainProvider>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text("No favs yet."),
      );
    }

    // return ListView(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.all(20),
    //       child: Text("You have ${appState.favorites.length} favorites."),
    //     ),
    //     for (var pair in appState.favorites)
    //       ListTile(
    //         title: Text(pair.asPascalCase),
    //         leading: Icon(LineIcons.heartAlt),
    //       ),
    //   ],
    // );

    // v2.2.1 starts
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 400 / 80,
            ),
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  leading: IconButton(
                    // icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                    icon: Icon(LineIcons.trash, semanticLabel: 'Delete'),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      appState.removeFavorite(pair);
                    },
                  ),
                  title: Text(
                    pair.asPascalCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
    // v2.2.1 ends
  }
}
