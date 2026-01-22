import 'package:app_mvvm_mptm_esmt/views/page_accueil.dart';   // Page d'accueil
import 'package:app_mvvm_mptm_esmt/views/page_compteur.dart';  // Page compteur
import 'package:app_mvvm_mptm_esmt/views/page_profil.dart';    // Page profil
import 'package:flutter/material.dart';

// Classe abstraite Routeur : sert à centraliser la gestion des routes de l'application.
// On définit ici toutes les routes disponibles et la route initiale.
abstract class Routeur {
  // Route initiale : c'est la première page affichée au lancement de l'application.
  static const String routeInitiale = '/page-accueil';

  // Map des routes : associe chaque chemin (String) à un constructeur de widget (WidgetBuilder).
  static final Map<String, WidgetBuilder> routes = {
    // Route vers la page d'accueil
    routeInitiale: (context) => PageAccueil(),

    // Route vers la page profil
    '/page-profil': (context) => PageProfil(),

    // Route vers la page compteur
    '/page-compteur': (context) => PageCompteur(),
  };
}