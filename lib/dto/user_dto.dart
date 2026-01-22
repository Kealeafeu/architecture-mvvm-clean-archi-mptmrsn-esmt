// UserDto : Data Transfer Object (DTO)
// Sert d'intermédiaire entre les données brutes (JSON venant d'une API)
// et le modèle métier (UserModel). Ici, il ne contient que des données simples,
// sans logique métier ni validation.
class UserDto {
  final int id;          // Identifiant de l'utilisateur
  final String name;     // Nom complet
  final String username; // Nom d'utilisateur
  final String email;    // Adresse email

  // Constructeur avec paramètres obligatoires
  UserDto({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  // Factory pour créer un UserDto à partir d'un JSON (Map<String, dynamic>)
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }

  // Conversion d'un UserDto en JSON (Map<String, dynamic>)
  // Remarque : il est plus naturel de ne pas passer userDto en paramètre,
  // mais d'utiliser directement les champs de l'instance courante (this).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
    };
  }
}