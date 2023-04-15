import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget CustomBottom(context) {
  return Container(
    
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: SafeArea(
      child: GNav(
        tabs: [
          GButton(
            onPressed: () {
               Navigator.pushNamed(context, 'editarPerfil', arguments: null);
            },
            icon: Icons.account_circle_outlined,
            iconSize: 45,
          ),
          GButton(
            onPressed: () {
               Navigator.pushNamed(context, 'telaPrincipal', arguments: null);
            },
            icon: Icons.home,
            iconSize: 45,
          ),
          GButton(
            onPressed: () {
            },
            icon: Icons.settings,
            iconSize: 45,
          ),
        ],
      ),
    ),
  );
}
