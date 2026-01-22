import 'dart:convert'; // Permet de convertir une réponse JSON en objets Dart

import 'package:app_mvvm_mptm_esmt/dto/user_dto.dart';       // Data Transfer Object (DTO) pour transformer les données brutes
import 'package:app_mvvm_mptm_esmt/models/user_model.dart';  // Modèle métier représentant un utilisateur
import 'package:app_mvvm_mptm_esmt/repositories/user_repository.dart'; // Interface UserRepository
import 'package:http/http.dart' as http;                     // Package HTTP pour effectuer des requêtes réseau

// Implémentation concrète de UserRepository qui utilise une API REST (jsonplaceholder.typicode.com)
class ApiUserRepository implements UserRepository {
  // URL de base de l'API
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";

  @override
  Future<UserModel> deleteUser(int identifait) {
    // TODO: implémenter la suppression d'un utilisateur via l'API
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetchAllUsers() async {
    List<UserModel> users = [];
    try {
      // Requête GET vers l'API pour récupérer tous les utilisateurs
      final response = await http.get(Uri.parse("$_baseUrl/users"));

      if (response.statusCode == 200) {
        print(response.body); // Affiche la réponse brute pour debug

        // 1. Décoder la réponse JSON en structure dynamique
        final resultat = jsonDecode(response.body);

        // 2. Convertir en une liste de Map<String, dynamic>
        List<Map<String, dynamic>> contenu = List<Map<String, dynamic>>.from(resultat);

        // 3. Transformer chaque élément en UserModel
        users = contenu.map((utilisateurEcours) {
          // 3.1 Créer un DTO à partir du JSON
          UserDto dto = UserDto.fromJson(utilisateurEcours);

          // 3.2 Transformer le DTO en modèle métier
          UserModel user = UserModel(
            identifiant: dto.id,
            prenomNom: dto.name,
            nomUtilisateur: dto.username,
            emailUtilisateur: dto.email,
          );

          // 3.3 Retourner le modèle
          return user;
        }).toList();

        return users;
      } else {
        // Si le code HTTP n'est pas 200, lever une exception
        throw Exception("Erreur de chargement d'utilisateurs");
      }
    } catch (e) {
      print("Erreur de chargement");
      rethrow; // Relance l'erreur pour être gérée par le ViewModel
    }
  }

  @override
  Future<UserModel> fetchUser(int identifiant) {
    // TODO: implémenter la récupération d'un utilisateur spécifique via l'API
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(UserModel user) {
    // TODO: implémenter la mise à jour d'un utilisateur via l'API
    throw UnimplementedError();
  }
}