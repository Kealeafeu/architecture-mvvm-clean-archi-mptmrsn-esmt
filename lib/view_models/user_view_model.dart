// sans utilidation de provider
import 'package:app_mvvm_mptm_esmt/models/user_model.dart';
import 'package:app_mvvm_mptm_esmt/repositories/user_repository.dart';

class UserViewModel {
  final UserRepository repository; // polymorphisme

  UserViewModel(this.repository);

  //Déclaration des variables d'état qui gère l'affichage
  List<UserModel> utilisateurs = [];

  String? erreur;

  bool isLoading = false;

  Future<void> chargementUtilisateur() async {
    erreur = null;
    isLoading = true;
    try {
      utilisateurs= await repository.fetchAllUsers(); //
    } catch (e) {
      erreur = e.toString();
      isLoading = false;
    } finally {
      isLoading = false;
    }
  }
}
