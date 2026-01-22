import 'package:app_mvvm_mptm_esmt/models/user_model.dart';       // Modèle représentant un utilisateur
import 'package:app_mvvm_mptm_esmt/repositories/user_repository.dart'; // Contrat (interface) que ce repository doit respecter

// Implémentation concrète de UserRepository qui utilisera Firestore comme source de données.
// Pour l'instant, toutes les méthodes sont non implémentées (UnimplementedError).
class FirestoreUserRepository implements UserRepository {
  @override
  Future<UserModel> deleteUser(int identifait) {
    // TODO: implémenter la suppression d'un utilisateur dans Firestore
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetchAllUsers() {
    // TODO: implémenter la récupération de tous les utilisateurs depuis Firestore
    // Exemple : utiliser FirebaseFirestore.instance.collection("users").get()
    throw UnimplementedError();
  }

  @override
  Future<UserModel> fetchUser(int identifiant) {
    // TODO: implémenter la récupération d'un utilisateur spécifique par son identifiant
    // Exemple : FirebaseFirestore.instance.collection("users").doc(identifiant.toString()).get()
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(UserModel user) {
    // TODO: implémenter la mise à jour des informations d'un utilisateur dans Firestore
    // Exemple : FirebaseFirestore.instance.collection("users").doc(user.identifiant.toString()).update({...})
    throw UnimplementedError();
  }
}