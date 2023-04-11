import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
           Scaffold.of(context).openDrawer();
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),
        ),
      ),
    ),
  );
}

Widget buildEndDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),
        ),
      ),
    ),
  );
}
