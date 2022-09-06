class User
{
  final String          id;
  final String       username;
        String?      email;
  final List<String> roles;
        String       accessToken;
        String       refreshToken;

  User({
    required this.id,
    required this.username,
             this.email,
    required this.roles,
    required this.accessToken,
    required this.refreshToken,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      roles: List<String>.from(json['roles']),
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
