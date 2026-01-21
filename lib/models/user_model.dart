class UserModel {
  final int _identifiant;
  String _prenomNom;
  String _nomUtilisateur;
  String _emailUtilisateur;
  UserModel({
    required int identifiant,
    required String prenomNom,
    required String nomUtilisateur,
    required String emailUtilisateur,
  }) : _identifiant = identifiant,
       _prenomNom = prenomNom,
       _nomUtilisateur = nomUtilisateur,
       _emailUtilisateur = emailUtilisateur {
    //Règle métier
    _validationIdentifiant(_identifiant);
    _validationPrenomNom(_prenomNom);
    _validationNomUtilisateur(_nomUtilisateur);
    _validationEmailUtilisateur(_emailUtilisateur);
  }
  //Règles métier privés
  _validationIdentifiant(int identifiant) {
    if (identifiant < 0) {
      throw Exception("Identifiant ne peut pas etre inférieur à 0");
    }
  }

  // ignore: strict_top_level_inference
  _validationPrenomNom(String prenomNom) {
    if (prenomNom.trim().isEmpty) {
      throw Exception("Le prénom et le nom ne doivent pas etre vides");
    }
  }

  // ignore: strict_top_level_inference
  _validationNomUtilisateur(String nomUtilisateur) {
    if (nomUtilisateur.trim().contains(' ')) {
      throw Exception("Le nom utilisateur ne doit pas contenir d'espace");
    }
  }

  // ignore: strict_top_level_inference
  _validationEmailUtilisateur(String emailUtilisateur) {
    if (!emailUtilisateur.trim().contains('@')) {
      throw Exception("L'adresse doit contenir @");
    }
  }

  // Les getters
  int get identifiant => _identifiant;
  String get prenomNom => _prenomNom;
  String get nomUtilisateur => _nomUtilisateur;
  String get emailUtilisateur => _emailUtilisateur;

  // Les méthodes métiers
  void changerPrenomNom(String nouveauPrenomNom) {
    _validationPrenomNom(nouveauPrenomNom);
    _prenomNom = nouveauPrenomNom;
  }

  void changerNomUtilisateur(String nouveauNomUtilisateur) {
    _validationNomUtilisateur(nouveauNomUtilisateur);
    _nomUtilisateur = nouveauNomUtilisateur;
  }

  void changerEmailUtilisateur(String nouvelEmailUtilisateur) {
    _validationEmailUtilisateur(nouvelEmailUtilisateur);
    _emailUtilisateur = nouvelEmailUtilisateur;
  }
}
