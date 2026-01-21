import 'package:app_mvvm_mptm_esmt/app_state.dart';
import 'package:app_mvvm_mptm_esmt/utilis/routeur.dart';
import 'package:app_mvvm_mptm_esmt/utilis/theme_perso.dart';
import 'package:app_mvvm_mptm_esmt/views/page_accueil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  AppState appState = AppState();
  runApp(
    ChangeNotifierProvider(
      //  create: (context) => AppState(),
      create: (context) => appState,
      child: MonApplication(),
    ),
  );
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    print("Construction de l'application");
    context.watch<AppState>();// S'abonne Mon appli à AppState

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routeur.routeInitiale,
      routes: Routeur.routes,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => PageAccueil()),
      locale: Locale('fr', 'FR'),
      supportedLocales: [Locale('fr', 'FR'), Locale('en', 'US')],
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: ThemePerso.modeClair,
      darkTheme: ThemePerso.modeSombre,

      // La sélection du thème
      themeMode: AppState().themeChoisi ?? ThemeMode.system,
    );
  }
}
