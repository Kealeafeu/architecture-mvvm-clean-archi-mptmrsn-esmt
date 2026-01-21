import 'package:app_mvvm_mptm_esmt/app_state.dart';
import 'package:app_mvvm_mptm_esmt/repositories/api_user_repository.dart';
import 'package:app_mvvm_mptm_esmt/view_models/user_view_model.dart';
import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  late UserViewModel _uvm; //

  @override
  void initState() {
    super.initState();

    _uvm = UserViewModel(ApiUserRepository());
    _recupereUsers();
  }

  Future<void> _recupereUsers() async {
    setState(() {});
    await _uvm.chargementUtilisateur();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        actions: [
          IconButton(
            onPressed: () {
              print('Passe en mode clair');
              AppState().themeChoisi =
                  ThemeMode.light; // Modification de la variable
              AppState().update(
                () {},
              ); //Rebuilder toutes les pages abonnées à notre instance
            },
            icon: Icon(Icons.light_mode),
          ),
          IconButton(
            onPressed: () {
              print("Passer en mode sombre");
              AppState().themeChoisi =
                  ThemeMode.dark; // Modification de la variable
              AppState().update(() {});
            },
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Center(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext) {
    //1. chargement en cours , on affiche le chargeur
    if (_uvm.isLoading) {
      return CircularProgressIndicator();
    }

    //2 Si erreur
    if (_uvm.erreur != null) {
      return Text(
        "Une erreur est survenue: ${_uvm.erreur!}",
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      );
    }
    // 3. Si liste vide
    if (_uvm.utilisateurs.isEmpty) {
      return Text("Aucun utilisateur trouvé");
    }
    //4. Pas besoin d'un if car à ce niveau , obligatoirement la variable utilisateur contient des utilisaterus , donc on retourne la liste view
    return ListView.separated(
      itemBuilder: (context, index) {
        // Récupération de l'utilisateur en cours
        final user = _uvm.utilisateurs[index];
        return ListTile(
          title: Text(user.prenomNom),
          subtitle: Text(user.emailUtilisateur),
          leading: CircleAvatar(
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
