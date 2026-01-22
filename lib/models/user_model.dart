class UserModel {
  // Attributs privés
  final int _identifiant;        // Identifiant unique de l'utilisateur (non modifiable après création)
  String _prenomNom;             // Prénom et nom de l'utilisateur
  String _nomUtilisateur;        // Nom d'utilisateur (login)
  String _emailUtilisateur;      // Adresse email

  // Constructeur avec paramètres obligatoires
  UserModel({
    required int identifiant,
    required String prenomNom,
    required String nomUtilisateur,
    required String emailUtilisateur,
  })  : _identifiant = identifiant,
        _prenomNom = prenomNom,
        _nomUtilisateur = nomUtilisateur,
        _emailUtilisateur = emailUtilisateur {
    // Validation des règles métier dès la création de l'objet
    _validationIdentifiant(_identifiant);
    _validationPrenomNom(_prenomNom);
    _validationNomUtilisateur(_nomUtilisateur);
    _validationEmailUtilisateur(_emailUtilisateur);
  }

  // Règles métier privées (validation des données)

  _validationIdentifiant(int identifiant) {
    if (identifiant < 0) {
      throw Exception("Identifiant ne peut pas être inférieur à 0");
    }
  }

  _validationPrenomNom(String prenomNom) {
    if (prenomNom.trim().isEmpty) {
      throw Exception("Le prénom et le nom ne doivent pas être vides");
    }
  }

  _validationNomUtilisateur(String nomUtilisateur) {
    if (nomUtilisateur.trim().contains(' ')) {
      throw Exception("Le nom utilisateur ne doit pas contenir d'espace");
    }
  }

  _validationEmailUtilisateur(String emailUtilisateur) {
    if (!emailUtilisateur.trim().contains('@')) {
      throw Exception("L'adresse doit contenir @");
    }
  }

  // Getters pour accéder aux attributs privés
  int get identifiant => _identifiant;
  String get prenomNom => _prenomNom;
  String get nomUtilisateur => _nomUtilisateur;
  String get emailUtilisateur => _emailUtilisateur;

  // Méthodes métiers pour modifier les données avec validation

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