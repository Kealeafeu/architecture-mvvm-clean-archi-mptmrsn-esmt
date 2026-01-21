import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  static final AppState _singleton = AppState._internal();

  AppState._internal();

  factory AppState() => _singleton;

  ThemeMode? themeChoisi; // toutes les variables globales

  bool estConnect = false;

  //Notifier tous les widgets abonnés à notre instance
  void update(VoidCallback callback) {
    callback();
    notifyListeners(); //permet de rebuilder toutes les pages abonnées
  }
}
