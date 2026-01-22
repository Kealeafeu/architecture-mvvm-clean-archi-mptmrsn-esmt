// Importation des modèles et du repository
import 'package:app_mvvm_mptm_esmt/models/user_model.dart';       // Représente la structure d'un utilisateur
import 'package:app_mvvm_mptm_esmt/repositories/user_repository.dart'; // Interface ou classe qui définit comment récupérer les utilisateurs

// UserViewModel : couche "ViewModel" dans l'architecture MVVM
// Elle fait le lien entre la Vue (UI) et le Repository (données).
// Ici, elle ne dépend pas de Provider, mais expose directement des variables d'état.
class UserViewModel {
  final UserRepository repository; // Polymorphisme : peut être n'importe quelle implémentation de UserRepository

  // Constructeur : on injecte le repository à utiliser
  UserViewModel(this.repository);

  // Variables d'état qui contrôlent l'affichage dans la Vue
  List<UserModel> utilisateurs = []; // Liste des utilisateurs récupérés
  String? erreur;                    // Message d'erreur éventuel
  bool isLoading = false;            // Indique si un chargement est en cours

  // Méthode asynchrone pour charger les utilisateurs
  Future<void> chargementUtilisateur() async {
    erreur = null;        // Réinitialise l'erreur
    isLoading = true;     // Active l'état "chargement"

    try {
      // Appel au repository pour récupérer tous les utilisateurs
      utilisateurs = await repository.fetchAllUsers();
    } catch (e) {
      // En cas d'erreur, on stocke le message
      erreur = e.toString();
      isLoading = false;
    } finally {
      // Qu'il y ait une erreur ou non, on désactive le chargement
      isLoading = false;
    }
  }
}