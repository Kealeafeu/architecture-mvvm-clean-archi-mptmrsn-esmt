import 'package:flutter/material.dart';

// AppState est une classe qui gère l'état global de l'application.
// Elle hérite de ChangeNotifier, ce qui permet de notifier les widgets
// abonnés lorsqu'un changement survient.
class AppState extends ChangeNotifier {
  // Création d'une instance unique (singleton) de AppState.
  // Cela garantit qu'il n'existe qu'une seule instance partagée
  // dans toute l'application.
  static final AppState _singleton = AppState._internal();

  // Constructeur privé : empêche la création directe d'instances
  // en dehors de cette classe.
  AppState._internal();

  // Factory : retourne toujours la même instance (_singleton).
  // Ainsi, chaque fois qu'on appelle AppState(), on obtient
  // l'unique instance partagée.
  factory AppState() => _singleton;

  // Variable globale pour stocker le thème choisi (clair, sombre ou système).
  ThemeMode? themeChoisi;

  // Variable globale indiquant si l'utilisateur est connecté ou non.
  bool estConnect = false;

  // Méthode utilitaire pour mettre à jour l'état.
  // Elle exécute une fonction (callback) puis appelle notifyListeners(),
  // ce qui force tous les widgets abonnés à se reconstruire
  // avec les nouvelles valeurs.
  void update(VoidCallback callback) {
    callback();
    notifyListeners(); // déclenche la reconstruction des widgets abonnés
  }
}