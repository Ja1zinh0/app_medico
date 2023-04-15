import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: non_constant_identifier_names
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
             margin: const EdgeInsets.only(left: 5,),
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
             margin: const EdgeInsets.only(right: 5),
            icon: Icons.settings,
            iconSize: 45,
          ),
        ],
      ),
    ),
  );
}
