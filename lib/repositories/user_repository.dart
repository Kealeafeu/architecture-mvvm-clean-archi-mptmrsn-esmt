import 'package:app_mvvm_mptm_esmt/models/user_model.dart';

// Définition d'une classe abstraite UserRepository.
// Elle représente le contrat (interface) que doivent respecter
// toutes les implémentations de repository pour gérer les utilisateurs.
abstract class UserRepository {
  // Méthode pour récupérer tous les utilisateurs.
  // Retourne une liste de UserModel.
  Future<List<UserModel>> fetchAllUsers();

  // Méthode pour récupérer un utilisateur spécifique
  // en fonction de son identifiant.
  Future<UserModel> fetchUser(int identifiant);

  // Méthode pour mettre à jour les informations d'un utilisateur.
  // Retourne l'utilisateur mis à jour.
  Future<UserModel> updateUser(UserModel user);

  // Méthode pour supprimer un utilisateur en fonction de son identifiant.
  // Retourne l'utilisateur supprimé (ou une confirmation).
  Future<UserModel> deleteUser(int identifait);
}