import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  const MenuOption({
    super.key,
    required this.title,
    required this.leading,
    required this.onTap,
    required this.selected,
  });
  final String title;
  final Icon leading;
  final Function()? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      leading: leading,
      onTap: onTap,
      selected: selected,
      selectedTileColor: Colors.amberAccent,
    );
  }
}
