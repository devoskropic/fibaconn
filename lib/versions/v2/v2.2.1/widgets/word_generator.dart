import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fibaconn/providers/main_provider.dart';
import 'package:line_icons/line_icons.dart';
import 'package:fibaconn/presentation/widgets/imports.dart';

class WordGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainProvider>();
    var pair = appState.current;
    var icoText;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = LineIcons.heartAlt;
      icoText = "disike";
    } else {
      icon = LineIcons.heart;
      icoText = "like";
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          SizedBox(height: 10),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavs();
                },
                icon: Icon(icon),
                label: Text(icoText),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
