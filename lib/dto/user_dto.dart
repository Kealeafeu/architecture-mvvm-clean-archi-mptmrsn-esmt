class UserDto {
  final int id;
  final String name;
  final String username;
  final String email;

  UserDto({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson(UserDto userDto) {
    return {
      'id': userDto.id,
      'name': userDto.name,
      'username': userDto.username,
      'email': userDto.email,
    };
  }
}
