import 'package:app_mvvm_mptm_esmt/models/user_model.dart';
import 'package:app_mvvm_mptm_esmt/repositories/user_repository.dart';

class FirestoreUserRepository implements UserRepository{
  @override
  Future<UserModel> deleteUser(int identifait) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetchAllUsers() {
    // TODO: implement fetchAllUsers
    // Récupération des données depuis firestore
    throw UnimplementedError();
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