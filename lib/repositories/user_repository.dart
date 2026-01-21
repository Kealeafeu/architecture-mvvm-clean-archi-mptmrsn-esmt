import 'package:app_mvvm_mptm_esmt/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> fetchAllUsers();
  Future<UserModel> fetchUser(int identifiant);
  Future<UserModel> updateUser(UserModel user);
  Future<UserModel> deleteUser(int identifait);
}
