import 'package:app_mvvm_mptm_esmt/app_state.dart';                // Gestion de l'état global (thème, connexion, etc.)
import 'package:app_mvvm_mptm_esmt/repositories/api_user_repository.dart'; // Repository pour récupérer les données utilisateurs via API
import 'package:app_mvvm_mptm_esmt/view_models/user_view_model.dart';      // ViewModel qui gère la logique métier des utilisateurs
import 'package:flutter/material.dart';

// Définition de la page d'accueil comme StatefulWidget
class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

// Classe associée qui gère l'état de la page d'accueil
class _PageAccueilState extends State<PageAccueil> {
  late UserViewModel _uvm; // ViewModel pour gérer les utilisateurs

  @override
  void initState() {
    super.initState();

    // Initialisation du ViewModel avec le repository
    _uvm = UserViewModel(ApiUserRepository());

    // Chargement des utilisateurs dès l'ouverture de la page
    _recupereUsers();
  }

  // Méthode asynchrone pour récupérer les utilisateurs
  Future<void> _recupereUsers() async {
    setState(() {}); // Force un rebuild pour afficher l'état "chargement"
    await _uvm.chargementUtilisateur(); // Appel au ViewModel pour charger les données
    setState(() {}); // Rebuild après récupération des données
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        actions: [
          // Bouton pour passer en mode clair
          IconButton(
            onPressed: () {
              print('Passe en mode clair');
              AppState().themeChoisi = ThemeMode.light; // Modification du thème
              AppState().update(() {}); // Notifie tous les widgets abonnés
            },
            icon: Icon(Icons.light_mode),
          ),
          // Bouton pour passer en mode sombre
          IconButton(
            onPressed: () {
              print("Passer en mode sombre");
              AppState().themeChoisi = ThemeMode.dark; // Modification du thème
              AppState().update(() {}); // Notifie tous les widgets abonnés
            },
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      // Corps de la page : centré et construit via _buildBody
      body: Center(child: _buildBody(context)),
    );
  }

  // Méthode qui construit le corps de la page en fonction de l'état du ViewModel
  Widget _buildBody(BuildContext) {
    // 1. Si chargement en cours
    if (_uvm.isLoading) {
      return CircularProgressIndicator();
    }

    // 2. Si une erreur est survenue
    if (_uvm.erreur != null) {
      return Text(
        "Une erreur est survenue: ${_uvm.erreur!}",
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      );
    }

    // 3. Si la liste est vide
    if (_uvm.utilisateurs.isEmpty) {
      return Text("Aucun utilisateur trouvé");
    }

    // 4. Sinon, affichage de la liste des utilisateurs
    return ListView.separated(
      itemBuilder: (context, index) {
        // Récupération de l'utilisateur en cours
        final user = _uvm.utilisateurs[index];
        return ListTile(
          title: Text(user.prenomNom),              // Nom complet
          subtitle: Text(user.emailUtilisateur),    // Email
          leading: CircleAvatar(                    // Avatar généré via un service externe
            radius: 40,
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/160?img=${user.identifiant}",
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(height: 3),
      itemCount: _uvm.utilisateurs.length,
    );
  }
}