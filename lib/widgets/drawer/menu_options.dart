import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  const MenuOption({
    super.key,
    required this.title,
    required this.onTap,
    required this.leading,
    required this.selected,
  });
  final String title;
  final Function()? onTap;
  final Icon leading;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      onTap: onTap,
      selected: selected,
      selectedTileColor: Colors.amberAccent,
    );
  }
}
