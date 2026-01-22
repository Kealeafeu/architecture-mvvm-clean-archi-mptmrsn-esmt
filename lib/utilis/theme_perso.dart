import 'package:flutter/material.dart';

// Définition d'une classe abstraite ThemePerso.
// Elle contient uniquement des thèmes statiques, donc on ne l'instancie jamais.
// Le but est de centraliser la configuration des thèmes clair et sombre.
abstract class ThemePerso {
  // Thème clair personnalisé
  static final ThemeData modeClair = ThemeData(
    // Définition d'une palette de couleurs basée sur une couleur "seed"
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink,              // Couleur principale
      brightness: Brightness.light,        // Mode clair
    ),
    useMaterial3: true,                     // Active Material Design 3
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink,        // Couleur de fond de l'AppBar
      foregroundColor: Colors.white,       // Couleur du texte et des icônes
      centerTitle: true,                   // Centre le titre dans l'AppBar
    ),
  );

  // Thème sombre personnalisé
  static final ThemeData modeSombre = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,            // Couleur principale
      brightness: Brightness.dark,         // Mode sombre
    ),
    useMaterial3: true,                     // Active Material Design 3
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple,      // Couleur de fond de l'AppBar
      centerTitle: true,                   // Centre le titre dans l'AppBar
    ),
  );
}