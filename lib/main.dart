// Importation des dépendances nécessaires
import 'package:app_mvvm_mptm_esmt/app_state.dart';          // Classe qui gère l'état global de l'application
import 'package:app_mvvm_mptm_esmt/utilis/routeur.dart';     // Gestionnaire des routes de navigation
import 'package:app_mvvm_mptm_esmt/utilis/theme_perso.dart'; // Définition des thèmes personnalisés (clair/sombre)
import 'package:app_mvvm_mptm_esmt/views/page_accueil.dart'; // Page d'accueil par défaut
import 'package:flutter/material.dart';                      // Bibliothèque Flutter pour les widgets
import 'package:flutter_localizations/flutter_localizations.dart'; // Support des langues et localisations
import 'package:provider/provider.dart';                     // Package Provider pour la gestion d'état

// Point d'entrée principal de l'application
void main() {
  AppState appState = AppState(); // Création d'une instance de l'état global

  runApp(
    ChangeNotifierProvider(
      // Fournit AppState à toute l'application
      create: (context) => appState,
      child: MonApplication(), // L'application principale
    ),
  );
}

// Définition de la classe principale de l'application
class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    print("Construction de l'application"); // Message de debug lors de la construction

    // Abonnement à AppState pour que l'application réagisse aux changements d'état
    context.watch<AppState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Supprime le bandeau "debug" en haut à droite

      // Définition de la route initiale (première page affichée)
      initialRoute: Routeur.routeInitiale,

      // Définition des routes disponibles dans l'application
      routes: Routeur.routes,

      // Gestion des routes inconnues : redirige vers la page d'accueil
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => PageAccueil()),

      // Définition de la langue par défaut (français)
      locale: Locale('fr', 'FR'),

      // Langues supportées par l'application
      supportedLocales: [Locale('fr', 'FR'), Locale('en', 'US')],

      // Définition des délégués pour la localisation (traductions des widgets Flutter)
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Thème clair personnalisé
      theme: ThemePerso.modeClair,

      // Thème sombre personnalisé
      darkTheme: ThemePerso.modeSombre,

      // Sélection du thème en fonction de l'état (choix utilisateur ou système)
      themeMode: AppState().themeChoisi ?? ThemeMode.system,
    );
  }
}