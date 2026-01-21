import 'package:app_mvvm_mptm_esmt/views/page_accueil.dart';
import 'package:app_mvvm_mptm_esmt/views/page_compteur.dart';
import 'package:app_mvvm_mptm_esmt/views/page_profil.dart';
import 'package:flutter/material.dart';

abstract class Routeur {
  static const String routeInitiale = '/page-accueil';
  static final Map<String, WidgetBuilder> routes = {
    routeInitiale: (context)=> PageAccueil(),
    '/page-profil':(context)=> PageProfil(),
    '/page-compteur':(context)=> PageCompteur(),

  };
}
