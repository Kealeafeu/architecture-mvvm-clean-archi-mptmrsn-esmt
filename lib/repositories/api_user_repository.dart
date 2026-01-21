import 'dart:convert';

import 'package:app_mvvm_mptm_esmt/dto/user_dto.dart';
import 'package:app_mvvm_mptm_esmt/models/user_model.dart';
import 'package:app_mvvm_mptm_esmt/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class ApiUserRepository implements UserRepository {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";
  @override
  Future<UserModel> deleteUser(int identifait) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetchAllUsers() async {
    List<UserModel> users = [];
    try {
      final response = await http.get(Uri.parse("$_baseUrl/users"));
      if (response.statusCode == 200) {
        print(response.body);

        //traitement avec UserDto et UserModel
        //Important

        // 1. Récupération des résultats en Map<dynamic
        final resultat = jsonDecode(response.body);

        // 2. Convertir le résultat en liste Map<String, Dynamic>
        List<Map<String, dynamic>> contenu = List<Map<String, dynamic>>.from(
          resultat,
        );

        // 3. Convertir contenu en List<UserModel>
        users = contenu.map((utilisateurEcours) {
          //3.1 Convertir l'utilisateur en cours en Dto
          UserDto dto = UserDto.fromJson(utilisateurEcours);

          // 3.2 Convertir le dto en modèle
          UserModel user = UserModel(
            identifiant: dto.id,
            prenomNom: dto.name,
            nomUtilisateur: dto.username,
            emailUtilisateur: dto.email,
          );

          // 3.3 On retourne le userModele dans la list
          return user;
        }).toList();
        return users;
      } else {
        throw Exception("Erreur de chargement d'utilisateurs");
      }
    } catch (e) {
      print("Erreur de chargement");
      rethrow;
    }
    
  }

  @override
  Future<UserModel> fetchUser(int identifiant) {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(UserModel user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
